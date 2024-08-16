import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/common/logger/app_logger.dart';
import 'package:flutter_tech_task/core/constants/cache/cache_constants.dart';
import 'package:flutter_tech_task/features/notification/data/repositories/i_notification_repository.dart';
import 'package:flutter_tech_task/features/notification/data/services/i_notification_local_service.dart';
import 'package:flutter_tech_task/features/notification/domain/entities/notification_entity/notification_entity.dart';

final class NotificationRepository implements INotificationRepository {
  NotificationRepository(this._notificationLocalService);

  final INotificationLocalService _notificationLocalService;

  @override
  Future<List<NotificationEntity>?> getNotificationsBooksFromCache() async {
    List<NotificationEntity>? notificationList = [];
    final response =
        await _notificationLocalService.get(CacheConstants.Notification.name);

    AppLogger.call(title: 'Notification Local Repository', value: response);

    if (response.isNullOrEmpty == false) {
      notificationList =
          response?.map((e) => NotificationEntity.fromJson(e)).toList();
    }

    return notificationList;
  }

  @override
  void updateNotificationsCache(List<NotificationEntity> notifications) {
    _notificationLocalService.put(
        CacheConstants.Notification.name, notifications);
  }
}
