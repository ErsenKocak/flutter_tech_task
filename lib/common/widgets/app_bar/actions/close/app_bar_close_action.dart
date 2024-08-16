import 'package:flutter/material.dart';
import 'package:flutter_tech_task/common/widgets/app_svg/app_svg_widget.dart';
import 'package:flutter_tech_task/core/constants/colors/app_dark_colors.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/core/router/app_router.dart';
import 'package:flutter_tech_task/generated/assets.gen.dart';

class AppBarCloseAction extends StatelessWidget {
  const AppBarCloseAction({super.key, this.onTap, this.color, this.height});
  final Function()? onTap;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AppSvgWidget(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          AppRouter.pop();
        }
      },
      path: Assets.icons.general.iconClose.path,
      color: color ??
          AppThemes.getColorByBrightness(
            lightColor: AppDarkColors.black,
            darkColor: AppLightColors.white,
          ),
      height: height,
    );
  }
}
