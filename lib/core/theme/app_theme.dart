import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors
  static const Color primaryBlue = Color(0xFF3B82F6);
  static const Color blackDark = Color(0xFF000000);
  static const Color slateLight = Color(0xFFF1F5F9);

  // Gold Accent Colors
  static const Color goldAccent = Color(0xFFD4AF37);     // light mode
  static const Color goldAccentDark = Color(0xFFF5C842); // dark mode
  
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
        tertiary: goldAccent,
        onTertiary: const Color(0xFFE5E2E1),
        tertiaryContainer: const Color(0xFFFDF3C0),
        onTertiaryContainer: const Color(0xFF5C4A00),
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
        tertiary: goldAccentDark,
        onTertiary: const Color(0xFF3A2E00),
        tertiaryContainer: const Color(0xFF4A3B00),
        onTertiaryContainer: const Color(0xFFF5C842),
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

// Extension to help pick colors
extension AppThemeX on ColorScheme {
  Color get cardBorder => brightness == Brightness.light 
    ? const Color(0xFFF1F5F9) 
    : const Color(0xFF262626);
    
  Color get subtleText => brightness == Brightness.light
    ? const Color(0xFF64748B)
    : const Color(0xFF94A3B8);

  Color get goldAccent => brightness == Brightness.light
      ? const Color(0xFFD4AF37)
      : const Color(0xFFF5C842);
}
