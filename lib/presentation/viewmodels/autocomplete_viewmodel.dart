import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../core/constants.dart';
import '../../core/utils/address_normalizer.dart';
import '../../data/datasources/mapbox_search_api.dart';
import '../../domain/entities/address_suggestion.dart';
import 'property_search_viewmodel.dart';

// ---------------------------------------------------------------------------
// Provider
// ---------------------------------------------------------------------------

final addressAutocompleteProvider =
    NotifierProvider<AutocompleteViewModel, AsyncValue<List<AddressSuggestion>?>>(() {
  return AutocompleteViewModel();
});

// ---------------------------------------------------------------------------
// ViewModel
// ---------------------------------------------------------------------------

class AutocompleteViewModel extends Notifier<AsyncValue<List<AddressSuggestion>?>> {
  /// Debounce timer — cancelled on each new keystroke.
  Timer? _debounceTimer;

  /// Generation counter — incremented before each async fetch so stale
  /// responses can be detected and discarded.
  int _generation = 0;

  /// Lazily-created API instance.
  final MapboxSearchApi _api = MapboxSearchApi();

  @override
  AsyncValue<List<AddressSuggestion>?> build() {
    // Cancel any pending timer when the provider is disposed.
    ref.onDispose(() => _debounceTimer?.cancel());
    return const AsyncValue.data(null);
  }

  // -------------------------------------------------------------------------
  // Public API
  // -------------------------------------------------------------------------

  /// Called on every keystroke from the search field.
  void onQueryChanged(String query) {
    if (query.length < AppConstants.autocompleteMinChars) {
      _debounceTimer?.cancel();
      _debounceTimer = null;
      state = const AsyncValue.data(null);
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
  Future<void> selectSuggestion(
    AddressSuggestion suggestion,
    MapboxMap mapboxMap,
  ) async {
    try {
      if (suggestion.latitude == null || suggestion.longitude == null) {
        state = AsyncValue.error(
          Exception('Could not retrieve coordinates.'),
          StackTrace.current,
        );
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

      // Trigger property search using street address only.
      final streetAddress = AddressNormalizer.streetOnly(suggestion.fullName);
      ref
          .read(propertySearchViewModelProvider.notifier)
          .searchByAddress(streetAddress);

      // Dismiss the overlay after successful navigation.
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Clears the suggestion list and cancels any pending timer.
  void dismiss() {
    _debounceTimer?.cancel();
    _debounceTimer = null;
    state = const AsyncValue.data(null);
  }

  // -------------------------------------------------------------------------
  // Private helpers
  // -------------------------------------------------------------------------

  Future<void> _fetchSuggestions(String query) async {
    _generation++;
    final capturedGeneration = _generation;

    state = const AsyncValue.loading();

    try {
      final suggestions = await _api.suggest(query);

      // Discard stale response.
      if (capturedGeneration != _generation) return;

      state = AsyncValue.data(suggestions);
    } catch (e, st) {
      if (capturedGeneration != _generation) return;
      state = AsyncValue.error(e, st);
    }
  }
}
