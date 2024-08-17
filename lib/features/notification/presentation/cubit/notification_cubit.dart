import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_tech_task/common/base/cubit/base_cubit.dart';
import 'package:flutter_tech_task/common/base/cubit/base_state.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/common/widgets/bottom_sheets/bottom_sheet/app_bottom_sheet.dart';
import 'package:flutter_tech_task/common/widgets/notification/notification_time_selecter_widget.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/features/notification/data/repositories/i_notification_repository.dart';
import 'package:flutter_tech_task/features/notification/domain/entities/notification_entity/notification_entity.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';
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
    await AppBottomSheet.show(
      child: (bottomSheetContext) => NotificationTimeSelecterWidget(
        onSelect: (_notificationDates, _notificationHour) {
          List<DateTime> notificationDates = _notificationDates;
          DateTime notificationHour = _notificationHour;

          notificationDates.forEach(
            (date) async {
              NotificationEntity notification = NotificationEntity(
                  id: book.id,
                  title: LocaleKeys.Notification_ReminderNotificationTitle.tr(),
                  body: LocaleKeys.Notification_ReminderNotificationBody.tr(
                      namedArgs: {'bookName': '"${book.title}"'}),
                  payload:
                      '${Application.deepLinkUrl}/bookDetail?id=${book.id}',
                  notificationDate: DateTime(
                    date.year,
                    date.month,
                    date.day,
                    notificationHour.hour,
                    notificationHour.minute,
                    0,
                  ));

              notifications.add(notification);

              await AppLocalNotificationHelper.scheduleNotification(
                  id: notification.id!,
                  title: notification.title,
                  body: notification.body,
                  payLoad: notification.payload,
                  scheduledNotificationDateTime: DateTime(
                    date.year,
                    date.month,
                    date.day,
                    notificationHour.hour,
                    notificationHour.minute,
                    0,
                  ));
            },
          );
          _notificationRepository.updateNotificationsCache(notifications);
          safeEmit(NotificationState.success(notifications));
        },
      ),
    );
  }
}
