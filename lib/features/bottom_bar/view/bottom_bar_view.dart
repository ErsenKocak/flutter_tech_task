import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/core/router/app_route_observer_mixin.dart';
import 'package:flutter_tech_task/core/router/app_router.dart';
import 'package:flutter_tech_task/core/router/app_routes.dart';
import 'package:flutter_tech_task/features/bottom_bar/mixin/bottom_bar_mixin.dart';
import 'package:flutter_tech_task/generated/assets.gen.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';
import 'package:flutter_tech_task/helper/localization/localization_helper.dart';
import 'package:stylish_bottom_bar/helpers/bottom_bar.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

@immutable
final class BottomBarView extends StatefulWidget {
  BottomBarView({super.key, required this.navigationShell});

  final Widget navigationShell;

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView>
    with BottomBarMixin, RouterObserverMixin {
  @override
  void initState() {
    AppLocalizationHelper.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      resizeToAvoidBottomInset: false,
      body: widget.navigationShell,
      bottomNavigationBar: _buildBottomNavigationBar,
    );
  }

  Widget get _buildBottomNavigationBar {
    return ValueListenableBuilder(
      valueListenable: activeIndexNotifier,
      builder: (context, activeIndexNotifierValue, child) {
        return StylishBottomBar(
          backgroundColor:
              AppThemes.currentTheme.bottomNavigationBarTheme.backgroundColor,
          hasNotch: true,
          elevation: 12,
          currentIndex: activeIndexNotifierValue,
          option: _bottomBarOptions,
          items: _buildBottomBarItems,
          onTap: _onTapBottomBarItem,
        );
      },
    );
  }

  BottomBarOption get _bottomBarOptions {
    return AnimatedBarOptions(
      iconSize: 24.h,
      barAnimation: BarAnimation.fade,
      iconStyle: IconStyle.Default,
      inkEffect: false,
      padding: EdgeInsets.only(top: 12.h),
    );
  }

  List<BottomBarItem> get _buildBottomBarItems {
    List<BottomBarItem> bottomBarItems = [
      _buildBottomBarItem(
        icon: Assets.icons.bottomBar.iconBottomBarHome.svg(
          color: AppThemes
              .currentTheme.bottomNavigationBarTheme.unselectedItemColor!,
          height: 24.h,
        ),
        selectedIcon:
            Assets.icons.bottomBar.iconBottomBarHomeActive.svg(height: 24.h),
        title: LocaleKeys.BottomNavigationBar_Home.tr(),
        viewIndex: 0,
      ),
      _buildBottomBarItem(
        icon: Assets.icons.general.iconLike.svg(
          color: AppThemes
              .currentTheme.bottomNavigationBarTheme.unselectedItemColor!,
          height: 24.h,
        ),
        selectedIcon: Assets.icons.general.iconLikeFill
            .svg(height: 24.h, color: AppLightColors.primaryPink),
        title: LocaleKeys.BottomNavigationBar_Favorites.tr(),
        viewIndex: 1,
      ),
      _buildBottomBarItem(
        icon: Assets.icons.bottomBar.iconBottomBarSettings.svg(
          color: AppThemes
              .currentTheme.bottomNavigationBarTheme.unselectedItemColor!,
          height: 24.h,
        ),
        selectedIcon: Assets.icons.bottomBar.iconBottomBarSettingsActive
            .svg(height: 24.h),
        title: LocaleKeys.BottomNavigationBar_Settings.tr(),
        viewIndex: 2,
      ),
    ];

    return bottomBarItems;
  }

  BottomBarItem _buildBottomBarItem({
    required Widget icon,
    required Widget selectedIcon,
    required String title,
    required int viewIndex,
  }) {
    return BottomBarItem(
      icon: icon,
      selectedIcon: selectedIcon,
      unSelectedColor:
          AppThemes.currentTheme.bottomNavigationBarTheme.unselectedItemColor!,
      selectedColor:
          AppThemes.currentTheme.bottomNavigationBarTheme.selectedItemColor!,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: AppThemes.currentTheme.textTheme.labelSmall?.copyWith(
            color: viewIndex == activeIndexNotifier.value
                ? AppLightColors.primaryPink
                : null,
          ),
        ),
      ),
    );
  }

  void _onTapBottomBarItem(int index) {
    _navigate(index);
  }

  _navigate(index) {
    String bottomNavigatorRoute = '';
    activeIndexNotifier.value = index;
    switch (index) {
      case 0:
        bottomNavigatorRoute = AppRoutes.Home.path;
      case 1:
        bottomNavigatorRoute = AppRoutes.Favorites.path;

      case 2:
        bottomNavigatorRoute = AppRoutes.Settings.path;
    }

    AppRouter.goNamed(bottomNavigatorRoute);
  }

  @override
  void didPop() {}

  @override
  Future<void> didPopNext() async {}

  @override
  void didPush() {}

  @override
  void didPushNext() {}
}
