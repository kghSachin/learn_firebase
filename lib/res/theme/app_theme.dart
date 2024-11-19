import 'package:flutter/material.dart';
import 'package:learn_firebase3/res/theme/colors.dart';

class AppTheme {
  static const OutlineInputBorder _border = OutlineInputBorder(
    borderSide: BorderSide(
      color: MyColors.textInputColor,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(28),
    ),
  );
  static ThemeData get myTheme => ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFFFF9800), // Orange for main UI elements
          onPrimary: Colors.white, // Text on primary color
          secondary: Color(0xFFFFC107), // Amber for accents
          onSecondary: Colors.black, // Text on secondary color
          surface: Colors.white, // White for cards and surfaces
          onSurface: Color(0xFF333333), // Darker text on background
          error: Color(0xFFD32F2F), // Deep red for error messages
          onError: Colors.white, // Text on error
          tertiary: Color(0xFF4CAF50), // Green for success
          onTertiary: Colors.white, // Text on success
          outline: Color(0xFFBDBDBD), // Light Gray for borders or outlines
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: _border,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 24,
          ),
          hintStyle: const TextStyle(
            color: MyColors.hintTextColor,
          ),
          focusedBorder: _border.copyWith(
            borderSide: const BorderSide(
              color: MyColors.primaryColor,
              width: 2,
            ),
          ),
          errorBorder: _border,
          enabledBorder: _border,
        ),
      );
}
