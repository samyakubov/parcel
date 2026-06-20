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
  Timer? _debounceTimer;
  int _generation = 0;
  late MapboxSearchApi _api;

  @override
  AsyncValue<List<AddressSuggestion>?> build() {
    _api = ref.watch(mapboxSearchApiProvider);
    ref.onDispose(() => _debounceTimer?.cancel());
    return const AsyncValue.data(null);
  }

  // -------------------------------------------------------------------------
  // Public API
  // -------------------------------------------------------------------------

  void onQueryChanged(String query) {
    if (query.length < AppConstants.autocompleteMinChars) {
      _debounceTimer?.cancel();
      _debounceTimer = null;
      state = const AsyncValue.data(null);
      return;
    }

    _debounceTimer?.cancel();
    _debounceTimer = Timer(
      Duration(milliseconds: AppConstants.autocompleteDebounceMs),
      () => _fetchSuggestions(query),
    );
  }

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

      final streetAddress = AddressNormalizer.streetOnly(suggestion.fullName);
      ref
          .read(propertySearchViewModelProvider.notifier)
          .searchByAddress(streetAddress);

      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

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
      final normalized = AddressNormalizer.streetOnly(query);
      final suggestions = await _api.suggest(normalized);

      if (capturedGeneration != _generation) return;

      state = AsyncValue.data(suggestions);
    } catch (e, st) {
      if (capturedGeneration != _generation) return;
      state = AsyncValue.error(e, st);
    }
  }
}
