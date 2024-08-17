import 'package:flutter_tech_task/features/notification/domain/entities/notification_entity/notification_entity.dart';

abstract class INotificationRepository {
  Future<List<NotificationEntity>?> getNotificationsBooksFromCache();
  void updateNotificationsCache(List<NotificationEntity> notifications);
}
