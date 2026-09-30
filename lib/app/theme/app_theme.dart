import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,

      scaffoldBackgroundColor: AppColors.background,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        surface: AppColors.surface,
        onPrimary: AppColors.white,
        onSurface: AppColors.textPrimary,
      ),

      fontFamily: 'Arial',

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
      ),

      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.textSecondary,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textSecondary,
        ),
        bodySmall: TextStyle(
          color: AppColors.textSecondary,
        ),
        titleLarge: TextStyle(
          color: AppColors.textPrimary,
        ),
        titleMedium: TextStyle(
          color: AppColors.textPrimary,
        ),
        titleSmall: TextStyle(
          color: AppColors.textPrimary,
        ),
      ),

      dividerColor: AppColors.border,

      cardColor: AppColors.surface,
    );
  }
}