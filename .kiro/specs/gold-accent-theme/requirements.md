# Requirements Document

## Introduction

This feature introduces a gold accent color into the Flutter app's existing Material 3 theme. Gold (#D4AF37 in light mode, #F5C842 in dark mode) will be added as a dedicated accent alongside the existing blue primary, used for key highlights, interactive elements, labels, borders, and decorative details. Both light and dark modes must be supported. The existing blue primary color is retained for functional/interactive roles where appropriate; gold supplements it as a visual accent.

## Glossary

- **AppTheme**: The class in `lib/core/theme/app_theme.dart` that defines `ThemeData` for light and dark modes.
- **AppThemeX**: The `ColorScheme` extension that exposes helper color getters (`cardBorder`, `subtleText`).
- **Gold_Accent**: The gold color token — `#D4AF37` in light mode, `#F5C842` in dark mode.
- **ColorScheme**: Flutter's Material 3 color role system applied via `ThemeData.colorScheme`.
- **Accent_Widget**: Any widget that uses `Gold_Accent` for highlights, borders, labels, or icons.
- **Theme_Consumer**: Any widget that reads colors from `Theme.of(context)` or `ColorScheme`.

---

## Requirements

### Requirement 1: Gold Accent Color Token

**User Story:** As a developer, I want a single source-of-truth gold accent color defined in the theme, so that all widgets reference a consistent token rather than hardcoded hex values.

#### Acceptance Criteria

1. THE `AppTheme` SHALL define a `goldAccent` static constant for light mode with value `Color(0xFFD4AF37)`.
2. THE `AppTheme` SHALL define a `goldAccentDark` static constant for dark mode with value `Color(0xFFF5C842)`.
3. THE `AppThemeX` extension on `ColorScheme` SHALL expose a `goldAccent` getter that returns `Color(0xFFD4AF37)` when `brightness` is `Brightness.light` and `Color(0xFFF5C842)` when `brightness` is `Brightness.dark`.
4. WHEN any `Theme_Consumer` widget reads `Theme.of(context).colorScheme.goldAccent`, THE `AppThemeX` SHALL return the correct gold value for the active brightness.

---

### Requirement 2: Light Theme Gold Integration

**User Story:** As a user viewing the app in light mode, I want gold accents to appear on key UI elements, so that the interface feels premium and visually distinct.

#### Acceptance Criteria

1. WHEN the light `ThemeData` is active, THE `AppTheme` SHALL set `ColorScheme.tertiary` to `Color(0xFFD4AF37)`.
2. WHEN the light `ThemeData` is active, THE `AppTheme` SHALL set `ColorScheme.onTertiary` to `Color(0xFFFFFFFF)` to ensure legible text on gold surfaces.
3. WHEN the light `ThemeData` is active, THE `AppTheme` SHALL set `ColorScheme.tertiaryContainer` to `Color(0xFFFDF3C0)` for subtle gold-tinted container backgrounds.
4. WHEN the light `ThemeData` is active, THE `AppTheme` SHALL set `ColorScheme.onTertiaryContainer` to `Color(0xFF5C4A00)` for legible text inside gold containers.

---

### Requirement 3: Dark Theme Gold Integration

**User Story:** As a user viewing the app in dark mode, I want gold accents to remain vibrant and legible against dark backgrounds, so that the premium feel is preserved in low-light conditions.

#### Acceptance Criteria

1. WHEN the dark `ThemeData` is active, THE `AppTheme` SHALL set `ColorScheme.tertiary` to `Color(0xFFF5C842)`.
2. WHEN the dark `ThemeData` is active, THE `AppTheme` SHALL set `ColorScheme.onTertiary` to `Color(0xFF3A2E00)` to ensure legible text on gold surfaces in dark mode.
3. WHEN the dark `ThemeData` is active, THE `AppTheme` SHALL set `ColorScheme.tertiaryContainer` to `Color(0xFF4A3B00)` for subtle gold-tinted container backgrounds in dark mode.
4. WHEN the dark `ThemeData` is active, THE `AppTheme` SHALL set `ColorScheme.onTertiaryContainer` to `Color(0xFFF5C842)` for legible text inside gold containers in dark mode.

---

### Requirement 4: Section Header Gold Accent

**User Story:** As a user, I want section headers to use gold for their subtitle/label text, so that structural hierarchy is visually reinforced with the gold accent.

#### Acceptance Criteria

1. WHEN `section_header.dart` renders a subtitle, THE `SectionHeader` widget SHALL use `colorScheme.goldAccent` instead of `colorScheme.secondary` for the subtitle text color.
2. WHILE the active brightness is dark, THE `SectionHeader` SHALL use the dark gold value (`Color(0xFFF5C842)`) for subtitle text.

---

### Requirement 5: Detail Grid Label Gold Accent

**User Story:** As a user, I want property detail grid labels to use gold, so that key data labels stand out with the accent color.

#### Acceptance Criteria

1. WHEN `detail_grid.dart` renders a label, THE `DetailGrid` widget SHALL use `colorScheme.goldAccent` for label text color instead of `colorScheme.secondary`.
2. THE `DetailGrid` SHALL preserve `colorScheme.onSurface` for value text color, unchanged.

---

### Requirement 6: Info Card Gold Border

**User Story:** As a user, I want info cards to have a subtle gold border highlight, so that card boundaries feel premium rather than plain grey.

#### Acceptance Criteria

1. WHEN `info_card.dart` renders a card border, THE `InfoCard` widget SHALL use `colorScheme.goldAccent` with opacity `0.35` for the border color instead of `colorScheme.cardBorder`.
2. WHILE the active brightness is dark, THE `InfoCard` SHALL use the dark gold value with opacity `0.35` for the border color.

---

### Requirement 7: Map Layer Toggle Gold Active State

**User Story:** As a user, I want the active map layer toggle icon to appear in gold, so that the selected state is clearly communicated with the accent color.

#### Acceptance Criteria

1. WHEN a map layer toggle is in the active state, THE `MapLayerToggle` widget SHALL use `colorScheme.goldAccent` for the active icon color instead of `colorScheme.primary`.
2. WHEN a map layer toggle is in the inactive state, THE `MapLayerToggle` widget SHALL retain its existing inactive color behavior unchanged.

---

### Requirement 8: Consistent Contrast and Accessibility

**User Story:** As a user with visual accessibility needs, I want gold accent text and icons to meet minimum contrast requirements, so that the UI remains readable.

#### Acceptance Criteria

1. THE `Gold_Accent` color on white (`#FFFFFF`) background in light mode SHALL achieve a contrast ratio of at least 3.0:1 as defined by WCAG 2.1 Level AA for large text and UI components.
2. THE `Gold_Accent` dark value on `Color(0xFF121212)` background in dark mode SHALL achieve a contrast ratio of at least 3.0:1.
3. IF `onTertiary` text is rendered on a `tertiary` gold background, THE contrast ratio SHALL be at least 4.5:1 for normal-sized text.

---

### Requirement 9: No Regression on Existing Colors

**User Story:** As a developer, I want the existing blue primary and semantic colors to remain unchanged, so that adding gold does not break existing UI components that rely on the current color scheme.

#### Acceptance Criteria

1. THE `AppTheme` SHALL retain `primaryBlue` (`Color(0xFF3B82F6)`) as `ColorScheme.primary` in both light and dark themes after the gold accent is introduced.
2. THE `AppTheme` SHALL retain all existing `secondary`, `surface`, `onSurface`, `error`, `scaffoldBackgroundColor`, `cardColor`, and `dividerColor` values unchanged.
3. THE `AppThemeX` extension SHALL retain the existing `cardBorder` and `subtleText` getters with their original return values.
4. WHEN widgets not listed in Requirements 4–7 read `colorScheme.primary` or `colorScheme.secondary`, THE `ColorScheme` SHALL return the same values as before this feature was introduced.
