import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/enums/app_mode/app_mode.dart';

class Application {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get applicationContext => navigatorKey.currentContext!;
  static String deepLinkUrl = 'http://fluttertechtask';

  /// Updated from env.json file.
  static int versionCode = 0;
  static String versionName = '';
  static String applicationName = 'TechTask';
  static AppMode appMode = AppMode.development;
  static String apiBaseUrl = '';
  static String firebaseTopic = '';
}
