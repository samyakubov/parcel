import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors
  static const Color primaryBlue = Color(0xFF3B82F6);
  static const Color blackDark = Color(0xFF000000);
  static const Color slateLight = Color(0xFFF1F5F9);
  
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        brightness: Brightness.light,
        surface: Colors.white,
        onSurface: const Color(0xFF1E293B),
        primary: primaryBlue,
        secondary: const Color(0xFF64748B),
      ),
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      cardColor: Colors.white,
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
        surface: const Color(0xFF121212), // Very dark grey/black
        onSurface: const Color(0xFFF8FAFC),
        primary: primaryBlue,
        secondary: const Color(0xFF94A3B8),
        error: const Color(0xFFEF4444),
      ),
      scaffoldBackgroundColor: blackDark, // Pure Black
      cardColor: const Color(0xFF121212), // Deep Black-Grey for cards
      dividerColor: const Color(0xFF262626), // Subtle divider for black
      textTheme: GoogleFonts.plusJakartaSansTextTheme(
        ThemeData.dark().textTheme,
      ).apply(
        bodyColor: const Color(0xFFF8FAFC),
        displayColor: Colors.white,
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
}
