import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData get lightThemeData {
    return ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.themeColor,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
    textTheme: const TextTheme(
      titleLarge:  TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400
        ),
        fillColor: Colors.white,
          filled: true,
          contentPadding:
          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.themeColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.themeColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.themeColor, width: 1),
          ),
        ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style:ElevatedButton.styleFrom(
              backgroundColor: AppColors.themeColor,
              fixedSize: const Size.fromWidth(
                double.maxFinite,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              )),
          ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.themeColor,
        )
      )
      );
  }

  static ThemeData get darkThemeData {
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.themeColor,
      ),
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
    );
  }

}
