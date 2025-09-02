import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'bookia',
    scaffoldBackgroundColor: AppColors.whiteColor,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.lightGrayColor),
      fillColor: AppColors.fieldGrayColor,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightGrayColor),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightGrayColor),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
