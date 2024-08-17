import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/common/widgets/card/general_card/general_card.dart';
import 'package:flutter_tech_task/common/widgets/switch/app_switch.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/core/router/app_router.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';
import 'package:flutter_tech_task/helper/localization/localization_helper.dart';

class SettingsLanguageItem extends StatelessWidget {
  const SettingsLanguageItem({super.key, required this.locale});

  final Locale locale;

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
              isChecked: locale == AppLocalizationHelper.currentLocale,
              onChanged: () async => await _onTapChangeLocale(),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildLabelText {
    String labelText = '';
    if (locale == AppLocalizationHelper.tr) {
      labelText = LocaleKeys.Languages_Turkish.tr();
    } else if (locale == AppLocalizationHelper.en) {
      labelText = LocaleKeys.Languages_English.tr();
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

  Future<void> _onTapChangeLocale() async {
    if (locale != AppLocalizationHelper.currentLocale) {
      await AppLocalizationHelper.changeLocale(locale: locale);

      await Future.delayed(
        Duration(milliseconds: 300),
        () async {
          AppRouter.pop();
        },
      );
    }
  }
}
