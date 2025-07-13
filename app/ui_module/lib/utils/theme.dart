
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF0A80ED);
  static const Color background = Color(0xFFF7FAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF0D141C);
  static const Color textSecondary = Color(0xFF4A739C);
  static const Color inputBackground = Color(0xFFE8EDF5);
  static const Color positive = Color(0xFF088738);
  static const Color newsBackground = Color(0xFFFAFAFA);
  static const Color newsText = Color(0xFF0F1417);
  static const Color newsTextSecondary = Color(0xFF5C738A);
}

class AppTextStyles {
  static const TextStyle h1 = TextStyle(
    fontFamily: 'Noto Sans',
    fontWeight: FontWeight.w700,
    fontSize: 28,
    color: AppColors.textPrimary,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    fontSize: 22,
    color: AppColors.textPrimary,
  );
  
  static const TextStyle h3 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyL = TextStyle(
    fontFamily: 'Noto Sans',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.textSecondary,
  );
  
  static const TextStyle bodyM = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const TextStyle button = TextStyle(
    fontFamily: 'Noto Sans',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.surface,
  );
}

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.primary,
      surface: AppColors.surface,
      background: AppColors.background,
      error: Colors.red,
      onPrimary: AppColors.surface,
      onSecondary: AppColors.surface,
      onSurface: AppColors.textPrimary,
      onBackground: AppColors.textPrimary,
      onError: AppColors.surface,
    ),
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.h1,
      displayMedium: AppTextStyles.h2,
      displaySmall: AppTextStyles.h3,
      bodyLarge: AppTextStyles.bodyL,
      bodyMedium: AppTextStyles.bodyM,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      hintStyle: AppTextStyles.bodyL,
    ),
  );
}
