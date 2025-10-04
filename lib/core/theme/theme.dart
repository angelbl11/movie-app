import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themed/themed.dart';

class AppTheme {
  static const darkPrimary = ColorRef(Color(0xFF2196F3));
  static const darkSecondary = ColorRef(Color(0xFF1E88E5));
  static const darkAccent = ColorRef(Color(0xFF42A5F5));

  static const darkBackgroundStart = ColorRef(Color(0xFF0D1117));
  static const darkBackgroundEnd = ColorRef(Color(0xFF161B22));
  static const darkSurface = ColorRef(Color(0xFF21262D));
  static const darkSurfaceVariant = ColorRef(Color(0xFF30363D));

  // Text colors
  static const darkTextPrimary = ColorRef(Color(0xFFFFFFFF));
  static const darkTextSecondary = ColorRef(Color(0xFFB3B3B3));
  static const darkTextTertiary = ColorRef(Color(0xFF8B949E));

  // Status colors
  static const darkSuccess = ColorRef(Color(0xFF28A745));
  static const darkWarning = ColorRef(Color(0xFFFFC107));
  static const darkError = ColorRef(Color(0xFFDC3545));

  static const primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0D1117), Color(0xFF161B22), Color(0xFF21262D)],
    stops: [0.0, 0.5, 1.0],
  );

  static final surfaceGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [const Color(0xFF1F1F1F), const Color(0xFF2C2C2C)],
  );

  static const accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2196F3), Color(0xFF1E88E5)],
  );

  // Typography for dark theme
  static TextStyle get heading1 => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.0,
    color: darkTextPrimary.color,
  );

  static TextStyle get heading2 => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    color: darkTextPrimary.color,
  );

  static TextStyle get heading3 => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
    color: darkTextPrimary.color,
  );

  static TextStyle get subtitle1 => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: darkTextPrimary.color,
  );

  static TextStyle get subtitle2 => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: darkTextPrimary.color,
  );

  static TextStyle get body1 => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: darkTextPrimary.color,
  );

  static TextStyle get body2 => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: darkTextSecondary.color,
  );

  static TextStyle get caption => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: darkTextTertiary.color,
  );

  static TextStyle get button => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.75,
    color: darkTextPrimary.color,
  );

  static TextStyle get overline => GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: darkTextTertiary.color,
  );

  // Widgets for gradient backgrounds
  static Widget gradientBackground({required Widget child}) {
    return Container(
      decoration: const BoxDecoration(gradient: primaryGradient),
      child: child,
    );
  }

  static Widget surfaceGradientBackground({required Widget child}) {
    return Container(
      decoration: BoxDecoration(gradient: surfaceGradient),
      child: child,
    );
  }

  // Light Theme Colors
  static const lightPrimary = ColorRef(Color(0xFF1976D2));
  static const lightSecondary = ColorRef(Color(0xFF1565C0));
  static const lightAccent = ColorRef(Color(0xFF2196F3));

  static const lightBackgroundStart = ColorRef(Color(0xFFF5F5F5));
  static const lightBackgroundEnd = ColorRef(Color(0xFFE0E0E0));
  static const lightSurface = ColorRef(Color(0xFFFFFFFF));
  static const lightSurfaceVariant = ColorRef(Color(0xFFF8F9FA));

  // Text colors for light theme
  static const lightTextPrimary = ColorRef(Color(0xFF212529));
  static const lightTextSecondary = ColorRef(Color(0xFF495057));
  static const lightTextTertiary = ColorRef(Color(0xFF6C757D));

  static const lightPrimaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF5F5F5), Color(0xFFE0E0E0), Color(0xFFFFFFFF)],
    stops: [0.0, 0.5, 1.0],
  );

  static final lightSurfaceGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.white, Colors.grey[100]!],
  );

  // Typography for light theme
  static TextStyle get lightHeading1 => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.0,
    color: lightTextPrimary.color,
  );

  static TextStyle get lightHeading2 => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    color: lightTextPrimary.color,
  );

  static TextStyle get lightHeading3 => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
    color: lightTextPrimary.color,
  );

  static TextStyle get lightSubtitle1 => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: lightTextPrimary.color,
  );

  static TextStyle get lightSubtitle2 => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: lightTextPrimary.color,
  );

  static TextStyle get lightBody1 => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: lightTextPrimary.color,
  );

  static TextStyle get lightBody2 => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: lightTextSecondary.color,
  );

  static TextStyle get lightCaption => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: lightTextTertiary.color,
  );

  static TextStyle get lightButton => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.75,
    color: lightTextPrimary.color,
  );

  static TextStyle get lightOverline => GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: lightTextTertiary.color,
  );

  static Widget lightGradientBackground({required Widget child}) {
    return Container(
      decoration: const BoxDecoration(gradient: lightPrimaryGradient),
      child: child,
    );
  }

  static Widget lightSurfaceGradientBackground({required Widget child}) {
    return Container(
      decoration: BoxDecoration(gradient: lightSurfaceGradient),
      child: child,
    );
  }

  // Dark Theme of Material Design
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF2196F3),
        secondary: Color(0xFF1E88E5),
        surface: Color(0xFF21262D),
        error: Color(0xFFDC3545),
        onPrimary: Color(0xFFFFFFFF),
        onSecondary: Color(0xFFFFFFFF),
        onSurface: Color(0xFFFFFFFF),
        onError: Color(0xFFFFFFFF),
      ),
      textTheme: TextTheme(
        headlineLarge: heading1,
        headlineMedium: heading2,
        headlineSmall: heading3,
        titleLarge: subtitle1,
        titleMedium: subtitle2,
        bodyLarge: body1,
        bodyMedium: body2,
        bodySmall: caption,
        labelLarge: button,
        labelSmall: overline,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: heading3,
        iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkPrimary.color,
          foregroundColor: darkTextPrimary.color,
          textStyle: button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      cardTheme: CardThemeData(
        color: darkSurface.color,
        elevation: 8,
        shadowColor: Colors.black.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkSurfaceVariant.color,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: darkPrimary.color, width: 2),
        ),
        hintStyle: body2.copyWith(color: darkTextTertiary.color),
        labelStyle: body2,
      ),
    );
  }

  // Light Theme of Material Design
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF1976D2),
        secondary: Color(0xFF1565C0),
        surface: Color(0xFFFFFFFF),
        error: Color(0xFFDC3545),
        onPrimary: Color(0xFFFFFFFF),
        onSecondary: Color(0xFFFFFFFF),
        onSurface: Color(0xFF212529),
        onError: Color(0xFFFFFFFF),
      ),
      textTheme: TextTheme(
        headlineLarge: lightHeading1,
        headlineMedium: lightHeading2,
        headlineSmall: lightHeading3,
        titleLarge: lightSubtitle1,
        titleMedium: lightSubtitle2,
        bodyLarge: lightBody1,
        bodyMedium: lightBody2,
        bodySmall: lightCaption,
        labelLarge: lightButton,
        labelSmall: lightOverline,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: lightHeading3,
        iconTheme: const IconThemeData(color: Color(0xFF212529)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightPrimary.color,
          foregroundColor: lightTextPrimary.color,
          textStyle: lightButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      cardTheme: CardThemeData(
        color: lightSurface.color,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightSurfaceVariant.color,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightPrimary.color, width: 2),
        ),
        hintStyle: lightBody2.copyWith(color: lightTextTertiary.color),
        labelStyle: lightBody2,
      ),
    );
  }
}
