import 'package:flutter/material.dart';
// import 'package:badges/badges.dart' as badges;
import 'package:flutter_tech_task/common/widgets/app_svg/app_svg_widget.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/generated/assets.gen.dart';

class AppBarNotificationAction extends StatefulWidget {
  const AppBarNotificationAction({super.key});

  @override
  State<AppBarNotificationAction> createState() =>
      _AppBarNotificationActionState();
}

class _AppBarNotificationActionState extends State<AppBarNotificationAction> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AppSvgWidget(
      path: Assets.icons.appBar.iconAppBarNotification.path,
      color: AppThemes.currentTheme.appBarTheme.actionsIconTheme?.color,
      onTap: () {},
    );

    // return BlocBuilder<NotificationCubit, NotificationState>(
    //   builder: (context, state) {
    //     return badges.Badge(
    //       showBadge: notificationCubit.checkForUnReadNotifications,
    //       badgeStyle: badges.BadgeStyle(
    //         badgeColor: AppLightColors.auxiliaryOrange,
    //         padding: EdgeInsets.all(4),
    //       ),
    //       position: badges.BadgePosition.topEnd(end: 1, top: 1),
    //       child: AppSvgWidget(
    //         path: Assets.icons.appBar.iconAppBarNotification.path,
    //         color: AppThemes.currentTheme.appBarTheme.actionsIconTheme?.color,
    //         onTap: () {},
    //       ),
    //     );
    //   },
    // );
  }
}
