import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/core/theme/gradient.dart';

class AppTheme {
  AppTheme._();

  //colors
  static const Color primary = Color(0xFF0066FF);
  static const Color secondary = Color(0xFF00D4AA);
  static const Color backgroundColor = Colors.white;
  static const Color surface = Color(0xFF112244);

  // You can add more: error, success, text, etc.
  static const Color textPrimary = Color(0xFF000000);
  // static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0C0FF);

  //Gradients
  static final LinearGradient blueGradient = Gradients.blueGradient;
  static final LinearGradient triangleTopRight = Gradients.triangleTopRight;

  //Fonts
  static String? get fontFamily => GoogleFonts.inter().fontFamily;

  static TextStyle headlineLarge = GoogleFonts.abel(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );
  static TextStyle headlineMedium = GoogleFonts.abel(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    color: textPrimary,
  );

  //Full theme data
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.dark,
      primary: primary,
      secondary: secondary,
      surface: surface,
    ),
    textTheme: TextTheme(headlineLarge: headlineLarge, bodyLarge: bodyLarge),
  );

  //Dark mode
  static ThemeData get darkTheme => lightTheme.copyWith();
  // static ThemeData get lightTheme => ThemeData.light();
}


///Learn about how to properly comment