import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF3B82F6);
  static const Color blackDark = Color(0xFF000000);
  static const Color slateLight = Color(0xFFF1F5F9);

  static const Color blueAccent = Color(0xFF2D5DA8);      // light mode
  static const Color blueAccentDark = Color(0xFF4A80D4);  // dark mode

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        brightness: Brightness.light,
        surface: const Color(0xFFF8FAFC),
        onSurface: const Color(0xFF1E293B),
        primary: primaryBlue,
        secondary: const Color(0xFF64748B),
      ).copyWith(
        tertiary: blueAccent,
        onTertiary: const Color(0xFFFFFFFF),
        tertiaryContainer: const Color(0xFFDBE8F8),
        onTertiaryContainer: const Color(0xFF0D2D5E),
      ),
      scaffoldBackgroundColor: const Color(0xFFF1F5F9),
      cardColor: const Color(0xFFF8FAFC),
      dividerColor: const Color(0xFFF1F5F9),
      textTheme: GoogleFonts.plusJakartaSansTextTheme(
        ThemeData.light().textTheme,
      ).apply(
        bodyColor: const Color(0xFF1E293B),
        displayColor: const Color(0xFF0F172A),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        brightness: Brightness.dark,
        surface: const Color(0xFF121212),
        onSurface: const Color(0xFFE5E2E1),
        primary: primaryBlue,
        secondary: const Color(0xFF94A3B8),
        error: const Color(0xFFEF4444),
      ).copyWith(
        tertiary: blueAccentDark,
        onTertiary: const Color(0xFFFFFFFF),
        tertiaryContainer: const Color(0xFF1A3A6B),
        onTertiaryContainer: const Color(0xFFBDD5F5),
      ),
      scaffoldBackgroundColor: blackDark, // Pure Black
      cardColor: const Color(0xFF121212), // Deep Black-Grey for cards
      dividerColor: const Color(0xFF262626), // Subtle divider for black
      textTheme: GoogleFonts.plusJakartaSansTextTheme(
        ThemeData.dark().textTheme,
      ).apply(
        bodyColor: const Color(0xFFE5E2E1),
        displayColor: const Color(0xFFE5E2E1),
      ),
    );
  }
}

extension AppThemeX on ColorScheme {
  Color get cardBorder => brightness == Brightness.light 
    ? const Color(0xFFF1F5F9) 
    : const Color(0xFF262626);
    
  Color get subtleText => brightness == Brightness.light
    ? const Color(0xFF64748B)
    : const Color(0xFF94A3B8);

  Color get goldAccent => brightness == Brightness.light
      ? const Color(0xFF2D5DA8)
      : const Color(0xFF4A80D4);
}
