import 'package:bloc/bloc.dart';
import 'package:flutter_tech_task/common/base/cubit/base_cubit.dart';
import 'package:flutter_tech_task/common/base/cubit/base_state.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/features/notification/data/repositories/i_notification_repository.dart';
import 'package:flutter_tech_task/features/notification/domain/entities/notification_entity/notification_entity.dart';
import 'package:flutter_tech_task/helper/notification/local_notification/local_notification_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';

part 'notification_state.dart';
part 'notification_cubit.freezed.dart';

class NotificationCubit extends Cubit<NotificationState> with BaseCubit {
  NotificationCubit(this._notificationRepository)
      : super(NotificationState.initial());

  final INotificationRepository _notificationRepository;
  late List<NotificationEntity> notifications;

  @override
  Future<void> initialize() async {
    await getNotificationsFromCache();
  }

  Future<void> getNotificationsFromCache() async {
    safeEmit(NotificationState.loading());

    final response =
        await _notificationRepository.getNotificationsBooksFromCache();

    if (response.isNullOrEmpty == true) {
      notifications = [];
      safeEmit(
          NotificationState.failure('Henüz bir bildirim bulunmamaktadır.'));
    } else {
      notifications = response!;
      safeEmit(NotificationState.success(notifications));
    }
  }

  bool checkBookHasNotification(BookEntity book) {
    bool isHasNotification = notifications.firstWhereOrNull(
                (notification) => notification.id == book.id) !=
            null
        ? true
        : false;

    return isHasNotification;
  }

  Future<void> onTapSetNotification(BookEntity book) async {
    await _setNotificationForBook(book);
  }

  Future<void> _setNotificationForBook(BookEntity book) async {
    DateTime notificationDate = DateTime.now().add(Duration(seconds: 2));

    NotificationEntity notification = NotificationEntity(
        id: book.id,
        title: 'Kitap hatırlatıcısı!',
        body: '"${book.title}" için geri dönmeyi unutma!',
        payload: '${Application.deepLinkUrl}/bookDetail?id=${book.id}',
        notificationDate: notificationDate);

    notifications.add(notification);
    safeEmit(NotificationState.success(notifications));

    _notificationRepository.updateNotificationsCache(notifications);

    await AppLocalNotificationHelper.scheduleNotification(
        id: notification.id!,
        title: notification.title,
        body: notification.body,
        payLoad: notification.payload,
        scheduledNotificationDateTime: notificationDate);
  }
}
