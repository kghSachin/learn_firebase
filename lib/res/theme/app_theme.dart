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
