import 'dart:convert';
import 'dart:developer';

import 'package:flutter_tech_task/common/logger/app_logger.dart';
import 'package:flutter_tech_task/core/constants/cache/cache_constants.dart';
import 'package:flutter_tech_task/core/mapper/api_model_mapper.dart';
import 'package:flutter_tech_task/features/favorites/data/services/i_favorites_local_service.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/features/notification/data/services/i_notification_local_service.dart';
import 'package:flutter_tech_task/features/notification/domain/entities/notification_entity/notification_entity.dart';
import 'package:hive/hive.dart';

final class NotificationLocalService extends INotificationLocalService {
  @override
  String get boxName => CacheConstants.Notification.name;

  @override
  void registerAdapters() {
    Hive.registerAdapter(
      CacheConstants.Notification.name,
      (json) => json?.map((e) => NotificationEntity.fromJson(e)).toList(),
    );
  }
}
