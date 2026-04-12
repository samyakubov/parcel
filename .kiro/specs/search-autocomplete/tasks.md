# Implementation Plan: Search Autocomplete

## Overview

Extend the existing `AddressSearchBar` widget with Mapbox-powered address autocomplete using clean architecture: a new domain entity, a dedicated datasource, a Riverpod ViewModel, and an overlay-based suggestion UI.

## Tasks

- [x] 1. Add autocomplete constants to `AppConstants`
  - Add `autocompleteDebounceMs`, `autocompleteMinChars`, and `autocompleteMaxResults` constants to `lib/core/constants.dart`
  - _Requirements: 6.1, 6.2_

- [x] 2. Create the `AddressSuggestion` domain entity
  - [x] 2.1 Implement `AddressSuggestion` freezed entity
    - Create `lib/domain/entities/address_suggestion.dart` with `mapboxId`, `fullName`, `context`, `latitude`, `longitude` fields
    - Run `dart run build_runner build` to generate `address_suggestion.freezed.dart` and `address_suggestion.g.dart`
    - _Requirements: 2.3_

- [x] 3. Implement `MapboxSearchApi` datasource
  - [x] 3.1 Create `lib/data/datasources/mapbox_search_api.dart`
    - Instantiate a dedicated `Dio` with base URL `https://api.mapbox.com/search/searchbox/v1` and `access_token` query param from `AppConstants.mapboxApiKey`
    - Implement `suggest(String query, String sessionToken)` — GET `/suggest`, map response `features` to `List<AddressSuggestion>`, cap at `autocompleteMaxResults`
    - Implement `retrieve(String mapboxId, String sessionToken)` — GET `/retrieve/:mapboxId`, extract coordinates from `features[0].geometry.coordinates`
    - Map `DioException` HTTP 401/403 to an `AutocompleteAuthException`, all other errors to `AutocompleteNetworkException`
    - _Requirements: 1.4, 2.2, 4.1, 5.1, 5.2_

- [ ] 4. Checkpoint — Ensure datasource tests pass
  - Ensure all tests pass, ask the user if questions arise.

- [x] 5. Implement `AutocompleteViewModel`
  - [x] 5.1 Define `AutocompleteState` sealed class and `AutocompleteErrorKind` enum
    - Create `lib/presentation/viewmodels/autocomplete_viewmodel.dart`
    - Define `AutocompleteIdle`, `AutocompleteLoading`, `AutocompleteResults`, `AutocompleteEmpty`, `AutocompleteError` states
    - _Requirements: 3.1, 5.1, 5.2_

  - [x] 5.2 Implement `AutocompleteViewModel` Riverpod `Notifier`
    - Implement `onQueryChanged`: clears state for < `autocompleteMinChars`, cancels pending debounce timer, starts new timer for ≥ `autocompleteMinChars`
    - Implement debounce using `Timer` with `AppConstants.autocompleteDebounceMs`; track a generation counter to discard stale responses
    - Implement `selectSuggestion`: calls `retrieve`, emits `flyTo` via `mapboxMap`, calls `PropertySearchViewModel.searchByAddress`, updates text
    - Implement `dismiss` and `clearError`
    - _Requirements: 1.1, 1.2, 1.3, 3.2, 4.2, 4.3, 4.4, 5.3, 5.4, 6.1, 6.2_


- [ ] 6. Checkpoint — Ensure ViewModel tests pass
  - Ensure all tests pass, ask the user if questions arise.

- [x] 7. Extend `AddressSearchBar` with suggestion overlay
  - [x] 7.1 Add overlay infrastructure to `_AddressSearchBarState`
    - Add `FocusNode`, `LayerLink`, and `OverlayEntry?` fields
    - Wrap the existing `TextField` in `CompositedTransformTarget`
    - Insert/remove `OverlayEntry` containing `CompositedTransformFollower` + `_SuggestionList` based on autocomplete state
    - Use `TapRegion` to detect outside taps and call `viewModel.dismiss()`
    - Wire `TextField.onChanged` to `viewModel.onQueryChanged`
    - _Requirements: 2.1, 2.5_

  - [x] 7.2 Implement `_SuggestionList` widget
    - Render a `Material`-wrapped `ListView` with up to `autocompleteMaxResults` items
    - Each item: primary text = `suggestion.fullName`, secondary text = `suggestion.context` (if non-null)
    - Loading state: show `CircularProgressIndicator` inside the list area
    - Empty state: show "No results found" text
    - Error state: show "Could not load suggestions. Please try again." or "Search unavailable." based on `AutocompleteErrorKind`
    - On item tap: call `viewModel.selectSuggestion`, populate `_controller.text`, dismiss overlay
    - _Requirements: 2.1, 2.2, 2.3, 2.4, 3.1, 4.3, 5.1, 5.2_

  - [x] 7.3 Add `Semantics` labels to suggestion items
    - Wrap each list item in `Semantics(label: suggestion.fullName, child: ...)`
    - _Requirements: 7.1, 7.2_

  - [x] 7.4 Show retrieve-failure snackbar
    - In `AddressSearchBar`, listen for `AutocompleteError(retrieveFailed)` and show a `SnackBar` with "Could not load location details."
    - _Requirements: 5.3_


- [x] 8. Wire `AutocompleteViewModel` into `MapScreen`
  - Pass the `MapboxMap` reference to `AutocompleteViewModel` after `_onMapCreated` so `selectSuggestion` can call `flyTo`
  - Ensure `MapScreen` does not duplicate the `flyTo` logic already handled by `AutocompleteViewModel`
  - _Requirements: 4.2_

## Notes

- Tasks marked with `*` are optional and can be skipped for a faster MVP
- Each task references specific requirements for traceability
- Property tests validate universal correctness properties defined in the design document
- Unit/widget tests validate specific examples and edge cases
- The `MapboxSearchApi` uses its own `Dio` instance — do not reuse `dioProvider`
- Run `dart run build_runner build --delete-conflicting-outputs` after creating the freezed entity
