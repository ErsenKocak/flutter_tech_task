import 'package:flutter/material.dart';
import 'package:flutter_tech_task/common/widgets/app_svg/app_svg_widget.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/core/router/app_router.dart';
import 'package:flutter_tech_task/generated/assets.gen.dart';

class AppBarArrowBackLeading extends StatelessWidget {
  const AppBarArrowBackLeading({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AppSvgWidget(
      path: Assets.icons.appBar.iconAppBarArrowBack.path,
      color: AppThemes.currentTheme.appBarTheme.actionsIconTheme?.color,
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          AppRouter.pop();
        }
      },
    );
  }
}
