import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/core/constants/colors/app_dark_colors.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/font_weight/app_font_weight.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';

class AppElevatedButton extends StatelessWidget {
  AppElevatedButton(
      {super.key,
      this.onPressed,
      this.child,
      required this.buttonText,
      this.buttonColor,
      this.borderColor,
      this.textColor,
      this.borderRadius,
      this.isLong = true,
      this.fontSize,
      this.fontWeight});

  final void Function()? onPressed;
  final Widget? child;
  final String buttonText;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final BorderRadiusGeometry? borderRadius;
  final bool? isLong;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: _buildButtonStyle,
        child: child ?? _buildButtonChild);
  }

  Widget get _buildButtonChild {
    return Text(
      buttonText,
      style: AppThemes.currentTheme.textTheme.bodyMedium?.copyWith(
        fontWeight: fontWeight ?? AppFontWeight.semiBold.value,
        fontSize: fontSize,
        color: onPressed == null
            ? AppLightColors.secondaryTextColor
            : textColor != null
                ? textColor
                : AppThemes.brightness == Brightness.light
                    ? AppLightColors.white
                    : AppDarkColors.secondaryDarkColor,
        letterSpacing: 1.0,
      ),
    );
  }

  ButtonStyle get _buildButtonStyle {
    return ElevatedButton.styleFrom(
      fixedSize: isLong == true
          ? Size(
              100.sw,
              48.h,
            )
          : null,
      backgroundColor: buttonColor ?? AppLightColors.primaryPink,
      disabledBackgroundColor: AppLightColors.gray100,
      side: BorderSide(
        width: 1,
        color: borderColor ?? Colors.transparent,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(42),
      ),
      elevation: 0,
    );
  }
}
