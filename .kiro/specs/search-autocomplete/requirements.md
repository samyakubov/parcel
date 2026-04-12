# Requirements Document

## Introduction

This feature adds Mapbox-powered address autocomplete to the existing `AddressSearchBar` widget. As the user types, the search bar will query the Mapbox Search Box API and display a dropdown list of place/address suggestions. Selecting a suggestion navigates the map camera to that location. The feature includes debouncing to limit API calls, and handles loading, empty, and error states gracefully. It integrates with the existing Riverpod architecture and the `PropertySearchViewModel` flow.

## Glossary

- **Autocomplete_Service**: The data source responsible for querying the Mapbox Search Box API and returning address suggestions.
- **Autocomplete_ViewModel**: The Riverpod notifier that manages autocomplete suggestion state, debouncing, and error handling.
- **Search_Bar**: The existing `AddressSearchBar` widget, extended to display the suggestion dropdown.
- **Suggestion**: A single address or place result returned by the Mapbox Search Box API, containing a display name, place type, and geographic coordinates.
- **Suggestion_List**: The dropdown overlay rendered beneath the Search_Bar showing the current list of Suggestions.
- **Mapbox_Search_API**: The Mapbox Search Box REST API (`https://api.mapbox.com/search/searchbox/v1/suggest`) used to retrieve address suggestions.
- **Debounce_Delay**: A configurable wait period (default 350ms) after the user stops typing before a query is sent to the Mapbox_Search_API.
- **Session_Token**: A UUID generated per search session, required by the Mapbox Search Box API to group suggest and retrieve calls for billing purposes.
- **Map_Camera**: The Mapbox map viewport controlled via `MapboxMap.flyTo`.

---

## Requirements

### Requirement 1: Trigger Autocomplete Suggestions While Typing

**User Story:** As a user, I want address suggestions to appear as I type in the search bar, so that I can quickly find and select a location without submitting a full search.

#### Acceptance Criteria

1. WHEN the user types a character into the Search_Bar and the input length is 2 or more characters, THE Autocomplete_ViewModel SHALL schedule a query to the Mapbox_Search_API after the Debounce_Delay has elapsed without further input.
2. WHEN the user types additional characters before the Debounce_Delay elapses, THE Autocomplete_ViewModel SHALL cancel the pending query and restart the Debounce_Delay.
3. WHEN the user clears the Search_Bar input to fewer than 2 characters, THE Autocomplete_ViewModel SHALL cancel any pending query and clear the current Suggestion_List.
4. THE Autocomplete_ViewModel SHALL include a Session_Token with every request to the Mapbox_Search_API.

---

### Requirement 2: Display Address Suggestions

**User Story:** As a user, I want to see a list of matching address suggestions below the search bar, so that I can choose the correct location.

#### Acceptance Criteria

1. WHEN the Mapbox_Search_API returns one or more Suggestions, THE Search_Bar SHALL render the Suggestion_List as an overlay directly beneath the search input field.
2. THE Suggestion_List SHALL display a maximum of 5 Suggestions at one time.
3. THE Suggestion_List SHALL display each Suggestion's full place name and, where available, a secondary line showing the place type or locality context.
4. WHEN the Mapbox_Search_API returns zero Suggestions for a non-empty query, THE Search_Bar SHALL display an empty-state message reading "No results found".
5. WHEN the Suggestion_List is visible and the user taps outside the Search_Bar, THE Search_Bar SHALL dismiss the Suggestion_List without modifying the current text input.

---

### Requirement 3: Loading State

**User Story:** As a user, I want visual feedback while suggestions are being fetched, so that I know the app is responding to my input.

#### Acceptance Criteria

1. WHILE the Autocomplete_ViewModel is awaiting a response from the Mapbox_Search_API, THE Search_Bar SHALL display a loading indicator inside the Suggestion_List area.
2. WHEN a new query is dispatched before the previous response has been received, THE Autocomplete_ViewModel SHALL discard the previous response and display only the result of the latest query.

---

### Requirement 4: Select a Suggestion to Navigate the Map

**User Story:** As a user, I want to tap a suggestion to fly the map to that location, so that I can view the area without manually entering coordinates.

#### Acceptance Criteria

1. WHEN the user taps a Suggestion in the Suggestion_List, THE Autocomplete_Service SHALL retrieve the full place details (including coordinates) from the Mapbox Search Box retrieve endpoint.
2. WHEN the full place details are retrieved successfully, THE Map_Camera SHALL animate to the selected location using `flyTo` with a zoom level of 16 and an animation duration of 1500ms.
3. WHEN the user taps a Suggestion, THE Search_Bar SHALL populate the text input with the selected Suggestion's full place name and dismiss the Suggestion_List.
4. WHEN the user taps a Suggestion that resolves to a valid address, THE Autocomplete_ViewModel SHALL trigger `PropertySearchViewModel.searchByAddress` with the selected place name so that property data is also fetched.

---

### Requirement 5: Error Handling

**User Story:** As a user, I want to be informed when address suggestions cannot be loaded, so that I understand why no results are shown.

#### Acceptance Criteria

1. IF the Mapbox_Search_API returns an HTTP error status or a network timeout, THEN THE Autocomplete_ViewModel SHALL transition to an error state and THE Search_Bar SHALL display an inline error message reading "Could not load suggestions. Please try again."
2. IF the Mapbox_Search_API returns an authentication error (HTTP 401 or 403), THEN THE Autocomplete_ViewModel SHALL transition to an error state and THE Search_Bar SHALL display the message "Search unavailable."
3. IF the retrieve call for a selected Suggestion fails, THEN THE Autocomplete_ViewModel SHALL display an error snackbar and SHALL NOT navigate the Map_Camera.
4. WHEN the user modifies the search input after an error state, THE Autocomplete_ViewModel SHALL clear the error state and resume normal debounced querying.

---

### Requirement 6: Debounce Configuration

**User Story:** As a developer, I want the debounce delay to be configurable, so that it can be tuned without modifying widget code.

#### Acceptance Criteria

1. THE Autocomplete_ViewModel SHALL read the Debounce_Delay from a single constant defined in `AppConstants`.
2. WHEN the Debounce_Delay constant is changed, THE Autocomplete_ViewModel SHALL apply the new value to all subsequent debounce timers without requiring changes to any other file.

---

### Requirement 7: Accessibility

**User Story:** As a user relying on assistive technology, I want the suggestion list to be navigable and readable, so that I can use autocomplete without visual interaction.

#### Acceptance Criteria

1. THE Suggestion_List SHALL assign a semantic label to each Suggestion item containing the full place name.
2. WHEN a Suggestion is focused via accessibility navigation, THE Search_Bar SHALL announce the Suggestion's place name to the platform accessibility service.
