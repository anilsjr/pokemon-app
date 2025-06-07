import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  // Dark theme
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.accentAqua,
      onPrimary: AppColors.textPrimary,
      secondary: AppColors.accentYellow,
      onSecondary: AppColors.textPrimary,
      background: AppColors.backgroundDark,
      onBackground: AppColors.textPrimary,
      surface: AppColors.backgroundCard,
      onSurface: AppColors.textPrimary,
      error: AppColors.accentRed,
      onError: AppColors.textPrimary,
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: AppColors.textPrimary,
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        color: AppColors.textTitle,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(color: AppColors.textPrimary),
      titleMedium: TextStyle(color: AppColors.textSecondary),
    ),
    dividerColor: AppColors.divider,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundLightDark,
      selectedItemColor: AppColors.accentYellow,
      unselectedItemColor: AppColors.textSecondary,
    ),
    cardTheme: CardTheme(
      color: AppColors.backgroundCard,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  // Light theme (you can implement this later if needed)
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.accentAqua,
      onPrimary: AppColors.textPrimary,
      secondary: AppColors.accentYellow,
      onSecondary: AppColors.textPrimaryLight,
      background: AppColors.backgroundLight,
      onBackground: AppColors.textPrimaryLight,
      surface: AppColors.backgroundLightCard,
      onSurface: AppColors.textPrimaryLight,
      error: AppColors.accentRed,
      onError: AppColors.textPrimary,
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.accentAqua,
      foregroundColor: AppColors.textPrimary,
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        color: AppColors.textPrimaryLight,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(color: AppColors.textPrimaryLight),
      titleMedium: TextStyle(color: AppColors.textSecondaryLight),
    ),
    dividerColor: Colors.grey.shade300,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.accentAqua,
      unselectedItemColor: Colors.grey,
    ),
    cardTheme: CardTheme(
      color: AppColors.backgroundLightCard,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
