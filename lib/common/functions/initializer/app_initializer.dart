import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tech_task/core/init/service_locator/service_locator.dart'
    as dependencyInjection;
import 'package:flutter_tech_task/core/cache/hive_cache_initializer.dart';
import 'package:flutter_tech_task/core/network/http_client/interceptor/dio_chucker_interceptor.dart';
import 'package:flutter_tech_task/core/network/http_client/model/cancel_token.dart';
import 'package:flutter_tech_task/helper/environment/app_environment_helper.dart';
import 'package:flutter_tech_task/helper/notification/local_notification/local_notification_helper.dart';

class AppInitializer {
  static initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await AppEnvironmentHelper.setAppEnviroments();
    await HiveCacheInitializer.initialize();
    await dependencyInjection.initalize();
    await AppLocalNotificationHelper.initialize();
    DioChuckerInterceptor.initalize();
    AppCancelToken.initialize();
    // await FirebaseNotificationHelper.initialize();
    // await FirebaseAnalyticsHelper.cr.initialize();
  }
}
