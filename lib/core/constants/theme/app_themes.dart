import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/core/constants/colors/app_dark_colors.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/font_family/app_font_family.dart';
import 'package:flutter_tech_task/core/constants/font_weight/app_font_weight.dart';
import 'package:flutter_tech_task/core/constants/text_styles/app_text_styles.dart';

final class AppThemes {
  static ThemeData get currentTheme => Theme.of(Application.applicationContext);

  static Brightness get brightness => currentTheme.brightness;

  static Color getColorByBrightness({
    required Color lightColor,
    required Color darkColor,
  }) =>
      currentTheme.brightness == Brightness.light ? lightColor : darkColor;

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        // ignore: deprecated_member_use
        useMaterial3: false,
        brightness: Brightness.light,
        primaryColor: AppLightColors.primaryPink,
        secondaryHeaderColor: AppLightColors.primaryPink,
        scaffoldBackgroundColor: AppLightColors.scaffoldColor,
        appBarTheme: AppBarTheme(
          color: AppLightColors.white,
          titleTextStyle: TextStyle(
            fontSize: 16,
            color: AppLightColors.black,
            fontFamily: AppFontFamily.EuclidCircular.value,
            fontWeight: AppFontWeight.semiBold.value,
          ),
          actionsIconTheme: const IconThemeData(
            color: AppLightColors.black,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppLightColors.white,
          selectedItemColor: AppLightColors.primaryPink,
          unselectedItemColor: AppLightColors.secondaryTextColor,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppLightColors.primaryPink,
          foregroundColor: AppLightColors.white,
        ),
        cardTheme: const CardTheme(
          color: AppLightColors.backgroundLightGrey,
        ),
        textTheme: TextTheme(
          labelSmall: AppTextStyles.generate(fontSize: 10),
          bodySmall: AppTextStyles.generate(fontSize: 12),
          bodyMedium: AppTextStyles.generate(fontSize: 14),
          bodyLarge: AppTextStyles.generate(fontSize: 16),
          titleSmall: AppTextStyles.generate(fontSize: 18),
          titleMedium: AppTextStyles.generate(
            fontSize: 20,
            fontWeight: AppFontWeight.semiBold,
          ),
          titleLarge: AppTextStyles.generate(
            fontSize: 24,
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        // ignore: deprecated_member_use
        useMaterial3: false,
        brightness: Brightness.dark,
        primaryColor: AppDarkColors.secondaryDarkColor,
        scaffoldBackgroundColor: AppDarkColors.primaryColor,
        secondaryHeaderColor: AppDarkColors.secondaryDarkColor,
        appBarTheme: AppBarTheme(
          color: AppDarkColors.primaryColor,
          titleTextStyle: TextStyle(
            color: AppDarkColors.white,
            fontSize: 16,
            fontFamily: AppFontFamily.EuclidCircular.value,
            fontWeight: AppFontWeight.semiBold.value,
          ),
          actionsIconTheme: const IconThemeData(
            color: AppDarkColors.white,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppDarkColors.secondaryDarkColor,
          selectedItemColor: AppDarkColors.primaryPink,
          unselectedItemColor: AppDarkColors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppDarkColors.primaryPink,
          foregroundColor: AppDarkColors.black,
        ),
        cardTheme: const CardTheme(
          color: AppDarkColors.secondaryDarkColor,
        ),
        textTheme: TextTheme(
          labelSmall: AppTextStyles.generate(
              fontSize: 10, color: AppDarkColors.primaryGrey),
          bodySmall: AppTextStyles.generate(
              fontSize: 12, color: AppDarkColors.primaryGrey),
          bodyMedium: AppTextStyles.generate(
              fontSize: 14, color: AppDarkColors.primaryGrey),
          bodyLarge: AppTextStyles.generate(
              fontSize: 16, color: AppDarkColors.primaryGrey),
          titleSmall: AppTextStyles.generate(
              fontSize: 18, color: AppDarkColors.primaryGrey),
          titleMedium: AppTextStyles.generate(
            fontSize: 20,
            color: AppDarkColors.white,
            fontWeight: AppFontWeight.semiBold,
          ),
          titleLarge: AppTextStyles.generate(
            fontSize: 24,
            color: AppDarkColors.white,
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
      );
}
