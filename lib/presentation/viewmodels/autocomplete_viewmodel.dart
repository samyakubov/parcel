import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../core/constants.dart';
import '../../data/datasources/mapbox_search_api.dart';
import '../../domain/entities/address_suggestion.dart';
import 'property_search_viewmodel.dart';

// ---------------------------------------------------------------------------
// State
// ---------------------------------------------------------------------------

sealed class AutocompleteState {
  const AutocompleteState();
}

class AutocompleteIdle extends AutocompleteState {
  const AutocompleteIdle();
}

class AutocompleteLoading extends AutocompleteState {
  const AutocompleteLoading();
}

class AutocompleteResults extends AutocompleteState {
  final List<AddressSuggestion> suggestions;
  const AutocompleteResults(this.suggestions);
}

class AutocompleteEmpty extends AutocompleteState {
  const AutocompleteEmpty();
}

class AutocompleteError extends AutocompleteState {
  final AutocompleteErrorKind kind;
  const AutocompleteError(this.kind);
}

enum AutocompleteErrorKind { network, auth, retrieveFailed }

// ---------------------------------------------------------------------------
// Provider
// ---------------------------------------------------------------------------

final autocompleteViewModelProvider =
    NotifierProvider<AutocompleteViewModel, AutocompleteState>(
        AutocompleteViewModel.new);

// ---------------------------------------------------------------------------
// ViewModel
// ---------------------------------------------------------------------------

class AutocompleteViewModel extends Notifier<AutocompleteState> {
  /// Session token — generated once per ViewModel lifecycle.
  late final String _sessionToken;

  /// Debounce timer — cancelled on each new keystroke.
  Timer? _debounceTimer;

  /// Generation counter — incremented before each async fetch so stale
  /// responses can be detected and discarded.
  int _generation = 0;

  /// Lazily-created API instance.
  final MapboxSearchApi _api = MapboxSearchApi();

  @override
  AutocompleteState build() {
    _sessionToken = DateTime.now().millisecondsSinceEpoch.toString();
    // Cancel any pending timer when the provider is disposed.
    ref.onDispose(() => _debounceTimer?.cancel());
    return const AutocompleteIdle();
  }

  // -------------------------------------------------------------------------
  // Public API
  // -------------------------------------------------------------------------

  /// Called on every keystroke from the search field.
  void onQueryChanged(String query) {
    // If currently in an error state, clear it first (requirement 5.4).
    if (state is AutocompleteError) {
      clearError();
    }

    if (query.length < AppConstants.autocompleteMinChars) {
      _debounceTimer?.cancel();
      _debounceTimer = null;
      state = const AutocompleteIdle();
      return;
    }

    // Cancel any pending debounce and start a fresh one.
    _debounceTimer?.cancel();
    _debounceTimer = Timer(
      Duration(milliseconds: AppConstants.autocompleteDebounceMs),
      () => _fetchSuggestions(query),
    );
  }

  /// Called when the user taps a suggestion in the list.
  ///
  /// Coordinates are already present on [suggestion] from the Geocoding v5
  /// suggest response, so no additional retrieve call is needed.
  Future<void> selectSuggestion(
    AddressSuggestion suggestion,
    MapboxMap mapboxMap,
    WidgetRef ref,
  ) async {
    try {
      if (suggestion.latitude == null || suggestion.longitude == null) {
        state = const AutocompleteError(AutocompleteErrorKind.retrieveFailed);
        return;
      }

      // Navigate the map camera.
      await mapboxMap.flyTo(
        CameraOptions(
          center: Point(
            coordinates: Position(
              suggestion.longitude!,
              suggestion.latitude!,
            ),
          ),
          zoom: 16.0,
        ),
        MapAnimationOptions(duration: 1500),
      );

      // Trigger property search using street address only (strip city/state/zip).
      final streetAddress = suggestion.fullName.contains(',')
          ? suggestion.fullName.split(',')[0].trim()
          : suggestion.fullName;
      ref
          .read(propertySearchViewModelProvider.notifier)
          .searchByAddress(streetAddress);

      // Dismiss the overlay after successful navigation.
      state = const AutocompleteIdle();
    } catch (_) {
      state = const AutocompleteError(AutocompleteErrorKind.retrieveFailed);
    }
  }

  /// Clears the suggestion list and cancels any pending timer.
  void dismiss() {
    _debounceTimer?.cancel();
    _debounceTimer = null;
    state = const AutocompleteIdle();
  }

  /// Clears an error state, returning to idle.
  void clearError() {
    if (state is AutocompleteError) {
      state = const AutocompleteIdle();
    }
  }

  // -------------------------------------------------------------------------
  // Private helpers
  // -------------------------------------------------------------------------

  Future<void> _fetchSuggestions(String query) async {
    // Increment generation so any in-flight request from a previous query
    // can detect it has been superseded (requirement 3.2).
    _generation++;
    final capturedGeneration = _generation;

    state = const AutocompleteLoading();

    try {
      final suggestions = await _api.suggest(query, _sessionToken);

      // Discard stale response.
      if (capturedGeneration != _generation) return;

      state = suggestions.isEmpty
          ? const AutocompleteEmpty()
          : AutocompleteResults(suggestions);
    } on AutocompleteAuthException {
      if (capturedGeneration != _generation) return;
      state = const AutocompleteError(AutocompleteErrorKind.auth);
    } catch (e) {
      if (capturedGeneration != _generation) return;
      // ignore: avoid_print
      print('[AutocompleteViewModel] suggest error: $e');
      state = const AutocompleteError(AutocompleteErrorKind.network);
    }
  }
}
