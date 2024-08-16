import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/common/logger/app_logger.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/core/router/app_router.dart';
import 'package:flutter_tech_task/core/router/app_routes.dart';
import 'package:timezone/data/latest.dart' as timeZone;
import 'package:timezone/timezone.dart' as timeZone;

final class AppLocalNotificationHelper {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static int _notificationId = 0;
  static String _androidNotificationId =
      '${Application.appMode}+${Application.applicationName} _NOTIFICATION_ID';

  static String _androidNotificationKey =
      '${Application.appMode}+${Application.applicationName} _NOTIFICATION_KEY';

  static Future<void> initialize() async {
    await flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        iOS: DarwinInitializationSettings(
          defaultPresentAlert: true,
          defaultPresentBadge: true,
          defaultPresentSound: true,
          requestAlertPermission: true,
          requestSoundPermission: true,
          requestBadgePermission: true,
          onDidReceiveLocalNotification: onDidReceiveLocalNotification,
        ),
        android: AndroidInitializationSettings("@drawable/notification_icon"),
      ),
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(
            AndroidNotificationChannel(
              _androidNotificationId,
              _androidNotificationKey,
              importance: Importance.max,
            ),
          );
    }
  }

  @pragma('vm:entry-point')
  static void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {
    AppLogger.call(
      title:
          '------- App Local Notification Helper onDidReceiveLocalNotification -------',
      value:
          'ID - $id ------- TITLE $title ------- BODY - $body ------- PAYLOAD - $payload',
    );
  }

  @pragma('vm:entry-point')
  static void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) {
    AppLogger.call(
      title:
          '------- App Local Notification Helper onDidReceiveNotificationResponse -------',
      value: 'Notification Response - ${notificationResponse.payload}',
    );

    if (notificationResponse.payload.isNullOrEmpty == false) {
      Uri? uri = Uri.tryParse(notificationResponse.payload!);
      if (uri != null) {
        AppLogger.call(title: 'URI Path', value: uri.path);
        AppLogger.call(
            title: 'URI Query Parameters', value: uri.queryParameters);

        AppRoutes route = uri.path.getAppRoute;

        String? currentRouteName =
            AppRouter.currentRoute(Application.applicationContext);

        if (currentRouteName.isNullOrEmpty == false &&
            currentRouteName != route.name) {
          AppRouter.navigatePushNamed(route.path,
              pathParameters: uri.queryParameters);
        }
      }
    }
  }

  static Future scheduleNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payLoad,
      required DateTime scheduledNotificationDateTime}) async {
    timeZone.initializeTimeZones();

    return flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        timeZone.TZDateTime.from(
          scheduledNotificationDateTime,
          timeZone.local,
        ),
        notificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: payLoad);
  }

  static Future<void> showNotification(RemoteMessage message) async {
    _notificationId++;

    if (message.notification != null) {
      if (Platform.isIOS) {
        await flutterLocalNotificationsPlugin.show(
          _notificationId,
          message.notification!.title,
          message.notification!.body,
          NotificationDetails(
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
              sound: 'default',
            ),
          ),
          payload: jsonEncode(message.data),
        );
      } else {
        await flutterLocalNotificationsPlugin.show(
          _notificationId,
          message.notification!.title,
          message.notification!.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidNotificationId,
              _androidNotificationKey,
              priority: Priority.high,
              showWhen: true,
              importance: Importance.max,
              enableVibration: true,
              playSound: true,
            ),
          ),
          payload: jsonEncode(message.data),
        );
      }
    }
  }

  static showLocalNotification({
    String? title,
    String? body,
    Map<String, dynamic>? data,
  }) {
    showNotification(
      RemoteMessage(
        data: data ?? {},
        notification: RemoteNotification(
          title: title,
          body: body,
        ),
      ),
    );
  }

  static notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }
}
