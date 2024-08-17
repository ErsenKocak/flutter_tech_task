import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/common/cubit/theme/data/enums/theme_mode_enum.dart';
import 'package:flutter_tech_task/common/cubit/theme/theme_cubit.dart';
import 'package:flutter_tech_task/common/widgets/card/general_card/general_card.dart';
import 'package:flutter_tech_task/common/widgets/switch/app_switch.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/core/init/service_locator/service_locator_provider.dart';
import 'package:flutter_tech_task/core/router/app_router.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';

class SettingsThemeItem extends StatelessWidget {
  const SettingsThemeItem({super.key, required this.themeMode});

  final ThemeModeEnum themeMode;

  @override
  Widget build(BuildContext context) {
    return GeneralCard(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: AppThemes.getColorByBrightness(
              lightColor: Colors.white, darkColor: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
          boxShadow: _boxShadow,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLabelText,
            AppSwitch(
              isChecked: themeMode ==
                  ServiceLocatorProvider.provide<ThemeCubit>()
                      .stateModel
                      .themeMode,
              onChanged: () async => await _onTapChangeTheme(),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildLabelText {
    String labelText = '';
    if (themeMode == ThemeModeEnum.Light) {
      labelText = LocaleKeys.Theme_Light.tr();
    } else if (themeMode == ThemeModeEnum.Dark) {
      labelText = LocaleKeys.Theme_Dark.tr();
    } else {
      labelText = LocaleKeys.Theme_System.tr();
    }
    return Text(
      labelText,
      style: AppThemes.currentTheme.textTheme.bodySmall,
    );
  }

  List<BoxShadow>? get _boxShadow {
    if (AppThemes.brightness == Brightness.light) {
      return [
        BoxShadow(
          color: AppLightColors.lightGrey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 4,
        ),
      ];
    }

    return null;
  }

  Future<void> _onTapChangeTheme() async {
    final themeCubit = ServiceLocatorProvider.provide<ThemeCubit>();
    themeCubit.changeThemeWithParameter(themeMode);
    AppRouter.pop();
  }
}
