import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/common/cubit/theme/data/enums/theme_mode_enum.dart';
import 'package:flutter_tech_task/common/extensions/sized_box/sized_box_extension.dart';
import 'package:flutter_tech_task/common/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_tech_task/common/widgets/bottom_sheets/bottom_sheet/app_bottom_sheet.dart';
import 'package:flutter_tech_task/common/widgets/scrollable_widgets/scrollable_body/scrollable_body.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/core/constants/colors/app_dark_colors.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/features/settings/presentation/widgets/settings_language_item/settings_language_item.dart';
import 'package:flutter_tech_task/features/settings/presentation/widgets/settings_list_item/data/entities/list_tile_item.dart';
import 'package:flutter_tech_task/features/settings/presentation/widgets/settings_list_item/list_tile_item_widget.dart';
import 'package:flutter_tech_task/features/settings/presentation/widgets/settings_theme_item.dart/settings_theme_item.dart';
import 'package:flutter_tech_task/generated/assets.gen.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';
import 'package:flutter_tech_task/helper/localization/localization_helper.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: _buildBody,
    );
  }

  get _buildAppbar {
    return AppBarWidget(
      titleText: LocaleKeys.Settings_Settings.tr(),
    );
  }

  Widget get _buildBody {
    return ScrollableBody(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          12.0.h.sbxh,
          _buildSettingsItems,
        ],
      ),
      withoutExpandedWidget: _buildVersionInformation,
    );
  }

  Widget get _buildSettingsItems {
    List<ListTileItem> viewItems = [
      ListTileItem(
        leadingWidget: _listTileItemLeading(
          Assets.icons.settings.iconLanguage.svg(),
        ),
        title: LocaleKeys.Settings_Language.tr(),
        onTap: () async {
          await AppBottomSheet.show(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
            child: (bottomSheetContext) => Column(
              children: [
                SettingsLanguageItem(locale: AppLocalizationHelper.tr),
                8.h.sbxh,
                SettingsLanguageItem(locale: AppLocalizationHelper.en),
                8.h.sbxh,
              ],
            ),
          );
        },
      ),
      ListTileItem(
        leadingWidget: _listTileItemLeading(
          Assets.icons.settings.iconTheme.svg(),
        ),
        title: LocaleKeys.Settings_Theme.tr(),
        onTap: () {
          AppBottomSheet.show(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
            child: (bottomSheetContext) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SettingsThemeItem(themeMode: ThemeModeEnum.Light),
                8.h.sbxh,
                SettingsThemeItem(themeMode: ThemeModeEnum.Dark),
                8.h.sbxh,
                SettingsThemeItem(themeMode: ThemeModeEnum.System),
              ],
            ),
          );
        },
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: viewItems.length,
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 24.h,
      ),
      itemBuilder: (context, index) =>
          ListTileItemWidget(item: viewItems[index]),
    );
  }

  Widget get _buildVersionInformation {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        '${Application.versionName}(${Application.versionCode})',
        style: AppThemes.currentTheme.textTheme.labelSmall,
      ),
    );
  }

  Widget _listTileItemLeading(Widget leading) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppThemes.getColorByBrightness(
          lightColor: AppLightColors.pink40,
          darkColor: AppDarkColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: leading,
    );
  }
}
