import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themed/themed.dart';

class AppTheme {
  // Dark Theme Colors (Principal para app de películas)
  static const darkPrimary = ColorRef(Color(0xFF2196F3)); // Azul vibrante
  static const darkSecondary = ColorRef(Color(0xFF1E88E5)); // Azul más oscuro
  static const darkAccent = ColorRef(
    Color(0xFF42A5F5),
  ); // Azul claro para acentos

  // Colores de fondo con degradados
  static const darkBackgroundStart = ColorRef(
    Color(0xFF0D1117),
  ); // Negro azulado muy oscuro
  static const darkBackgroundEnd = ColorRef(
    Color(0xFF161B22),
  ); // Negro azulado oscuro
  static const darkSurface = ColorRef(
    Color(0xFF21262D),
  ); // Gris oscuro para superficies
  static const darkSurfaceVariant = ColorRef(
    Color(0xFF30363D),
  ); // Gris medio oscuro

  // Colores de texto
  static const darkTextPrimary = ColorRef(Color(0xFFFFFFFF)); // Blanco puro
  static const darkTextSecondary = ColorRef(Color(0xFFB3B3B3)); // Gris claro
  static const darkTextTertiary = ColorRef(Color(0xFF8B949E)); // Gris medio

  // Colores de estado
  static const darkSuccess = ColorRef(Color(0xFF28A745)); // Verde para éxito
  static const darkWarning = ColorRef(
    Color(0xFFFFC107),
  ); // Amarillo para advertencia
  static const darkError = ColorRef(Color(0xFFDC3545)); // Rojo para error

  // Degradados predefinidos
  static const primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0D1117), Color(0xFF161B22), Color(0xFF21262D)],
    stops: [0.0, 0.5, 1.0],
  );

  static const surfaceGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF21262D), Color(0xFF30363D)],
  );

  static const accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2196F3), Color(0xFF1E88E5)],
  );

  // Typography con Google Fonts
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

  // Widgets de fondo degradado
  static Widget gradientBackground({required Widget child}) {
    return Container(
      decoration: const BoxDecoration(gradient: primaryGradient),
      child: child,
    );
  }

  static Widget surfaceGradientBackground({required Widget child}) {
    return Container(
      decoration: const BoxDecoration(gradient: surfaceGradient),
      child: child,
    );
  }

  // Light Theme Colors
  static const lightPrimary = ColorRef(
    Color(0xFF1976D2),
  ); // Azul más oscuro para contraste
  static const lightSecondary = ColorRef(Color(0xFF1565C0)); // Azul medio
  static const lightAccent = ColorRef(Color(0xFF2196F3)); // Azul vibrante

  // Colores de fondo para tema claro
  static const lightBackgroundStart = ColorRef(
    Color(0xFFF5F5F5),
  ); // Gris muy claro
  static const lightBackgroundEnd = ColorRef(Color(0xFFE0E0E0)); // Gris claro
  static const lightSurface = ColorRef(Color(0xFFFFFFFF)); // Blanco puro
  static const lightSurfaceVariant = ColorRef(
    Color(0xFFF8F9FA),
  ); // Blanco con tinte gris

  // Colores de texto para tema claro
  static const lightTextPrimary = ColorRef(Color(0xFF212529)); // Negro suave
  static const lightTextSecondary = ColorRef(Color(0xFF495057)); // Gris oscuro
  static const lightTextTertiary = ColorRef(Color(0xFF6C757D)); // Gris medio

  // Degradados para tema claro
  static const lightPrimaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF5F5F5), Color(0xFFE0E0E0), Color(0xFFFFFFFF)],
    stops: [0.0, 0.5, 1.0],
  );

  static const lightSurfaceGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFFFFF), Color(0xFFF8F9FA)],
  );

  // Typography para tema claro
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

  // Widgets de fondo degradado para tema claro
  static Widget lightGradientBackground({required Widget child}) {
    return Container(
      decoration: const BoxDecoration(gradient: lightPrimaryGradient),
      child: child,
    );
  }

  static Widget lightSurfaceGradientBackground({required Widget child}) {
    return Container(
      decoration: const BoxDecoration(gradient: lightSurfaceGradient),
      child: child,
    );
  }

  // Tema de Material Design - Dark Theme
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

  // Tema de Material Design - Light Theme
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
