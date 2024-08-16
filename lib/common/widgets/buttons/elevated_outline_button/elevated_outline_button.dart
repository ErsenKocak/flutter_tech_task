import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/font_weight/app_font_weight.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';

class AppElevatedOutlineButton extends StatelessWidget {
  AppElevatedOutlineButton({
    super.key,
    this.onPressed,
    required this.buttonText,
    this.buttonColor,
    this.borderColor,
    this.textColor,
    this.borderRadius,
    this.isLong = true,
  });

  final void Function()? onPressed;
  final String buttonText;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final BorderRadiusGeometry? borderRadius;
  final bool? isLong;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _buildButtonStyle,
      child: _buildButtonChild,
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
      backgroundColor: buttonColor != null
          ? buttonColor
          : AppThemes.brightness == Brightness.light
              ? AppLightColors.white
              : Colors.transparent,
      disabledBackgroundColor: AppLightColors.gray100,
      side: BorderSide(
        width: 1,
        color: onPressed == null
            ? Colors.transparent
            : borderColor ?? AppLightColors.primaryPink,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(42),
      ),
      elevation: 0,
    );
  }

  Widget get _buildButtonChild {
    return Text(
      buttonText,
      style: AppThemes.currentTheme.textTheme.bodyMedium?.copyWith(
        fontWeight: AppFontWeight.semiBold.value,
        color: onPressed == null
            ? AppLightColors.secondaryTextColor
            : textColor ?? AppLightColors.primaryPink,
        letterSpacing: 1.0,
      ),
    );
  }
}
