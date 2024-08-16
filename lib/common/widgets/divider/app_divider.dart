import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/constants/colors/app_dark_colors.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.height, this.dividerColor});
  final double? height;
  final Color? dividerColor;
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 1,
      color: dividerColor ??
          AppThemes.getColorByBrightness(
              lightColor: AppLightColors.dark200,
              darkColor: AppDarkColors.dark900),
    );
  }
}
