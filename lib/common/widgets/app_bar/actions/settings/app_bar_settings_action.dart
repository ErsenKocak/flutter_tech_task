import 'package:flutter/material.dart';
import 'package:flutter_tech_task/common/widgets/app_svg/app_svg_widget.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/core/router/app_router.dart';
import 'package:flutter_tech_task/core/router/app_routes.dart';
import 'package:flutter_tech_task/generated/assets.gen.dart';

class AppBarSettingsAction extends StatelessWidget {
  const AppBarSettingsAction({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSvgWidget(
      onTap: () => AppRouter.goNamed(AppRoutes.Settings.path),
      path: Assets.icons.appBar.iconAppBarSettings.path,
      color: AppThemes.currentTheme.appBarTheme.actionsIconTheme?.color,
    );
  }
}
