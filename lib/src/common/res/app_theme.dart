import 'package:flutter/material.dart';
import 'package:tele_flicks/src/common/res/app_colors.dart';
import 'package:tele_flicks/src/common/res/app_text_styles.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.lightPrimary,
    ),
    textTheme: AppTextStyles.txtTheme,
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: AppColors.primaryGrey),
        errorStyle: TextStyle(color: AppColors.primaryRed)),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.darkPrimary,
      background: AppColors.darkBackground,
    ),
    textTheme: AppTextStyles.txtTheme,
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: AppColors.primaryGrey),
        errorStyle: TextStyle(color: AppColors.primaryRed)),
  );
}
