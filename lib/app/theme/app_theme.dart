import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        surface: AppColors.surface,
      ),

      fontFamily: 'Arial',

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.textSecondary,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}