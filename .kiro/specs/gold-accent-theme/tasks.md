# Implementation Plan: Gold Accent Theme

## Overview

Introduce gold accent colors into the existing Material 3 Flutter theme by modifying `AppTheme`, extending `AppThemeX`, and updating four leaf widgets. No new files are created.

## Tasks

- [x] 1. Add gold color constants and extend AppThemeX
  - Add `static const Color goldAccent = Color(0xFFD4AF37)` and `static const Color goldAccentDark = Color(0xFFF5C842)` to `AppTheme` in `lib/core/theme/app_theme.dart`
  - Add `Color get goldAccent` getter to `AppThemeX` extension returning the correct value per `brightness`
  - _Requirements: 1.1, 1.2, 1.3, 1.4_

  - [ ]* 1.1 Write property test for goldAccent getter brightness consistency
    - **Property 1: goldAccent getter brightness consistency**
    - For both `Brightness.light` and `Brightness.dark`, assert `colorScheme.goldAccent` returns the correct hex value
    - **Validates: Requirements 1.3, 1.4**

- [x] 2. Wire gold into ColorScheme.tertiary roles for both themes
  - In `AppTheme.light`, use `.copyWith()` on the generated `ColorScheme` to set `tertiary`, `onTertiary`, `tertiaryContainer`, `onTertiaryContainer` to the light gold values
  - In `AppTheme.dark`, do the same with dark gold values
  - _Requirements: 2.1, 2.2, 2.3, 2.4, 3.1, 3.2, 3.3, 3.4_

  - [ ]* 2.1 Write property test for tertiary == goldAccent invariant
    - **Property 2: Tertiary color round-trip**
    - For both `AppTheme.light` and `AppTheme.dark`, assert `colorScheme.tertiary == colorScheme.goldAccent`
    - **Validates: Requirements 2.1, 3.1**

  - [ ]* 2.2 Write property test for onTertiary contrast invariant
    - **Property 3: onTertiary contrast invariant**
    - For both themes, compute the WCAG contrast ratio between `onTertiary` and `tertiary`; assert ratio >= 4.5
    - **Validates: Requirements 8.3**

  - [ ]* 2.3 Write unit tests for tertiary color values
    - Assert exact hex values for `tertiary`, `onTertiary`, `tertiaryContainer`, `onTertiaryContainer` in both light and dark themes
    - Assert contrast ratios for `goldAccent` on white (>= 3.0) and dark gold on `#121212` (>= 3.0)
    - _Requirements: 2.1–2.4, 3.1–3.4, 8.1, 8.2_

- [ ] 3. Checkpoint — ensure all theme tests pass
  - Ensure all tests pass, ask the user if questions arise.

- [x] 4. Update SectionHeader to use gold for subtitle text
  - In `lib/presentation/widgets/property_details/widgets/section_header.dart`, replace `colorScheme.secondary` with `colorScheme.goldAccent` for the subtitle `TextStyle` color
  - _Requirements: 4.1, 4.2_

  - [ ]* 4.1 Write property test for SectionHeader subtitle color
    - **Property 4 (combined 4.1/4.2): SectionHeader subtitle uses goldAccent**
    - Render `SectionHeader` under both light and dark themes; assert subtitle `TextStyle.color == colorScheme.goldAccent`
    - **Validates: Requirements 4.1, 4.2**

- [x] 5. Update DetailGrid to use gold for label text
  - In `lib/presentation/widgets/property_details/widgets/detail_grid.dart`, replace `colorScheme.secondary` with `colorScheme.goldAccent` for label text color
  - Verify value text color remains `colorScheme.onSurface`
  - _Requirements: 5.1, 5.2_

  - [ ]* 5.1 Write property test for DetailGrid label color
    - **Property 5: DetailGrid label uses goldAccent**
    - Render `DetailGrid` under both themes; assert label color == `goldAccent` and value color == `onSurface`
    - **Validates: Requirements 5.1, 5.2**

- [x] 6. Update InfoCard to use gold border
  - In `lib/presentation/widgets/property_details/widgets/info_card.dart`, replace `colorScheme.cardBorder` with `colorScheme.goldAccent.withOpacity(0.35)` for the border color
  - _Requirements: 6.1, 6.2_

  - [ ]* 6.1 Write property test for InfoCard border color
    - **Property 6 (combined 6.1/6.2): InfoCard border uses goldAccent with opacity**
    - Render `InfoCard` under both themes; assert border color == `goldAccent.withOpacity(0.35)`
    - **Validates: Requirements 6.1, 6.2**

- [x] 7. Update MapLayerToggle active icon to use gold
  - In `lib/presentation/widgets/map_layer_toggle.dart`, replace `colorScheme.primary` with `colorScheme.goldAccent` for the active icon color only
  - Leave inactive icon color unchanged
  - _Requirements: 7.1, 7.2_

  - [ ]* 7.1 Write property test for MapLayerToggle active icon color
    - **Property 7: MapLayerToggle active icon uses goldAccent**
    - Render `MapLayerToggle` in active state under both themes; assert icon color == `goldAccent`
    - **Validates: Requirements 7.1**

  - [ ]* 7.2 Write property test for MapLayerToggle inactive regression
    - **Property 8: MapLayerToggle inactive icon does not use goldAccent**
    - Render `MapLayerToggle` in inactive state; assert icon color != `goldAccent`
    - **Validates: Requirements 7.2**

- [ ] 8. Regression — verify primary and existing extension getters are unchanged
  - _Requirements: 9.1, 9.2, 9.3_

  - [ ]* 8.1 Write property test for primary color preservation
    - **Property 9: Primary color preservation**
    - For both `AppTheme.light` and `AppTheme.dark`, assert `colorScheme.primary == Color(0xFF3B82F6)`
    - **Validates: Requirements 9.1**

  - [ ]* 8.2 Write property test for existing AppThemeX getters unchanged
    - **Property 10: Existing extension getters unchanged**
    - For both brightness values, assert `cardBorder` and `subtleText` return their original values
    - **Validates: Requirements 9.3**

  - [ ]* 8.3 Write unit tests for existing color regression
    - Assert `secondary`, `surface`, `onSurface`, `scaffoldBackgroundColor`, `cardColor`, `dividerColor` are unchanged in both themes
    - _Requirements: 9.2_

- [ ] 9. Final checkpoint — ensure all tests pass
  - Ensure all tests pass, ask the user if questions arise.

## Notes

- Tasks marked with `*` are optional and can be skipped for a faster MVP
- All widget changes are in existing files — no new files needed
- Property tests use `fast_check` (Dart PBT library), minimum 100 iterations each
- Tag each property test with: `// Feature: gold-accent-theme, Property N: <property_text>`
