import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/core/enums/app_mode/app_mode.dart';

class AppEnvironmentHelper {
  static Future<void> setAppEnviroments() async {
    String environmentString = await rootBundle.loadString('.env.json');
    Map environment = jsonDecode(environmentString);

    Application.appMode = AppMode.values[environment["environmentMode"]];
    late String platformKey;
    platformKey = Platform.operatingSystem;
    Application.applicationName =
        '${environment["applicationName"]}${Application.appMode.appTag}';
    Application.apiBaseUrl =
        environment["apiBaseUrl"][Application.appMode.path];
    Application.versionName =
        environment["versionName"][Application.appMode.path][platformKey];
    Application.versionCode =
        environment["versionCode"][Application.appMode.path][platformKey];
    Application.firebaseTopic = environment["firebaseTopic"];

    log('API BASE URL -- ${Application.apiBaseUrl}');
    log('VERSION NAME -- ${Application.versionName}');
    log('VERSION CODE -- ${Application.versionCode}');
    log('Application Name -- ${Application.applicationName}');
    log('App Mode -- ${Application.appMode}');
    log('Bundle ID -- ${environment["bundleId"][Application.appMode.path][platformKey]}');
  }
}
