import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/core/constants/colors/app_dark_colors.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/core/utils/theme/text_theme/text_theme.dart';

class AppSearchInput extends StatelessWidget {
  const AppSearchInput(
      {super.key,
      this.height,
      this.width,
      this.color,
      this.radius,
      this.controller,
      this.hintText,
      this.prefixIcon,
      this.readOnly = false,
      this.onTap,
      this.onChanged,
      this.onSubmitted});
  final double? height;
  final double? width;
  final Color? color;
  final BorderRadius? radius;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final bool readOnly;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 38.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: color ??
            AppThemes.getColorByBrightness(
                lightColor: AppLightColors.white,
                darkColor: AppDarkColors.secondaryDarkColor),
        borderRadius: radius ?? BorderRadius.circular(38.sp),
      ),
      child: Center(
        child: TextField(
          onSubmitted: onSubmitted,
          onTap: onTap,
          onChanged: onChanged,
          readOnly: readOnly,
          controller: controller,
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          style: AppThemes.currentTheme.textTheme.labelSmall
              ?.copyWith(height: 17 / 11.sp),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: context.textTheme.xSmall.regular
                  .copyWith(height: 17 / 11.sp, color: AppLightColors.dark400),
              prefixIcon: prefixIcon ??
                  Icon(
                    Icons.search,
                    size: 24.sp,
                  ),
              suffixIcon: GestureDetector(
                child: Icon(Icons.clear),
                onTap: () => controller?.clear(),
              )),
        ),
      ),
    );
  }
}
