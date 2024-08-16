import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/constants/font_weight/app_font_weight.dart';
import 'package:flutter_tech_task/core/constants/text_styles/app_text_styles.dart';

extension CustomTextThemeSuper on BuildContext {
  CustomTextTheme get textTheme => CustomTextTheme();
}

class CustomTextTheme {
  HeadingTextTheme get heading => HeadingTextTheme();
  BodyTextTheme get body => BodyTextTheme();
  Small get small => Small();
  XSmall get xSmall => XSmall();
  XxSmall get xxSmall => XxSmall();
}

class HeadingTextTheme {
  TextStyle get h1 => AppTextStyles.generate(
        fontSize: 26,
        fontWeight: AppFontWeight.medium,
      );

  TextStyle get h2 => AppTextStyles.generate(
        fontSize: 26,
        fontWeight: AppFontWeight.medium,
      );

  TextStyle get h3 => AppTextStyles.generate(
        fontSize: 22,
        fontWeight: AppFontWeight.medium,
      );

  TextStyle get h4 => AppTextStyles.generate(
        fontSize: 22,
        fontWeight: AppFontWeight.medium,
      );

  TextStyle get h5 => AppTextStyles.generate(
        fontSize: 20,
        fontWeight: AppFontWeight.medium,
      );
  TextStyle get h5SemiBold => AppTextStyles.generate(
        fontSize: 20,
        fontWeight: AppFontWeight.semiBold,
      );

  TextStyle get h6 => AppTextStyles.generate(
        fontSize: 20,
        fontWeight: AppFontWeight.medium,
      );
}

class BodyTextTheme {
  TextStyle get large => AppTextStyles.generate(
        fontSize: 18,
        fontWeight: AppFontWeight.semiBold,
      );

  TextStyle get largeMedium => AppTextStyles.generate(
        fontSize: 18,
        fontWeight: AppFontWeight.medium,
      );
  TextStyle get largeRegular => AppTextStyles.generate(
        fontSize: 18,
        fontWeight: AppFontWeight.regular,
      );

  TextStyle get defaultBold => AppTextStyles.generate(
        fontSize: 16,
        fontWeight: AppFontWeight.bold,
      );

  TextStyle get defaultSemibold => AppTextStyles.generate(
        fontSize: 16,
        fontWeight: AppFontWeight.semiBold,
      );

  TextStyle get defaultMedium => AppTextStyles.generate(
        fontSize: 16,
        fontWeight: AppFontWeight.medium,
      );
  TextStyle get defaultRegular => AppTextStyles.generate(
        fontSize: 16,
        fontWeight: AppFontWeight.regular,
      );

  TextStyle get defaultLight => AppTextStyles.generate(
        fontSize: 16,
        fontWeight: AppFontWeight.light,
      );

  TextStyle get smallSemibold => AppTextStyles.generate(
        fontSize: 14,
        fontWeight: AppFontWeight.semiBold,
      );

  TextStyle get smallMedium => AppTextStyles.generate(
        fontSize: 14,
        fontWeight: AppFontWeight.medium,
      );

  TextStyle get smallRegular => AppTextStyles.generate(
        fontSize: 14,
        fontWeight: AppFontWeight.regular,
      );
  TextStyle get smallLight => TextStyle(
        fontSize: 14,
        height: 17 / 14,
        fontWeight: AppFontWeight.light.value,
      );
}

class Small {
  TextStyle get semibold => AppTextStyles.generate(
        fontSize: 12,
        fontWeight: AppFontWeight.semiBold,
      );

  TextStyle get medium => AppTextStyles.generate(
        fontSize: 12,
        fontWeight: AppFontWeight.medium,
      );

  TextStyle get regular => AppTextStyles.generate(
        fontSize: 12,
        fontWeight: AppFontWeight.regular,
      );
}

class XSmall {
  TextStyle get semibold => AppTextStyles.generate(
        fontSize: 10,
        fontWeight: AppFontWeight.semiBold,
      );

  TextStyle get medium => AppTextStyles.generate(
        fontSize: 10,
        fontWeight: AppFontWeight.medium,
      );

  TextStyle get regular => AppTextStyles.generate(
        fontSize: 10,
        fontWeight: AppFontWeight.regular,
      );

  TextStyle get light => TextStyle(
        fontSize: 10,
        height: 15 / 10,
        fontWeight: AppFontWeight.light.value,
      );
}

class XxSmall {
  TextStyle get semibold => AppTextStyles.generate(
        fontSize: 8,
        fontWeight: AppFontWeight.semiBold,
      );
  TextStyle get medium => AppTextStyles.generate(
        fontSize: 8,
        fontWeight: AppFontWeight.medium,
      );

  TextStyle get regular => AppTextStyles.generate(
        fontSize: 8,
        fontWeight: AppFontWeight.regular,
      );
}
