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
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF4A90E2), // Soft Blue for main UI elements
          onPrimary: Colors.white, // Text on primary color
          secondary: Color(0xFFFFC107), // Amber for accents
          onSecondary: Colors.black, // Dark Gray for text on background
          surface: Colors.white, // White for cards, surfaces
          onSurface: Color(0xFF333333), // Dark Gray text on cards
          error: Color(0xFFB00020), // Red for error messages
          onError: Colors.white, // Text on error
          tertiary: Color(0xFF4CAF50), // Green for success
          onTertiary: Colors.white, // Text on success
          outline: Color(0xFF666666), // For secondary text
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
