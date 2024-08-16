// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_tech_task/core/constants/application/application.dart';
// import 'package:flutter_tech_task/core/enums/app_mode/app_mode.dart';

// class FirebaseCrashlyticsHelper {
//   static late FirebaseCrashlytics _instance;

//   static Future<void> initialize() async {
//     _instance = FirebaseCrashlytics.instance;
//     bool isCrashlyticsActive = Application.appMode != AppMode.development;

//     await _instance.setCrashlyticsCollectionEnabled(isCrashlyticsActive);
//     FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
//   }

//   static Future<void> testCrash() async {
//     _instance.crash();
//   }
// }
