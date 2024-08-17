import 'package:flutter/material.dart';
import 'package:flutter_tech_task/common/functions/date/app_date_functions.dart';
import 'package:flutter_tech_task/common/widgets/notification/notification_time_selecter_widget.dart';

mixin NotificationTimeSelecterMixin on State<NotificationTimeSelecterWidget> {
  ///  1 = Time Picker , 2 = Date Picker
  late ValueNotifier<int> showingPickerNotifier;
  late ValueNotifier<DateTime> notificationHourNotifier;
  late ValueNotifier<List<DateTime>> notificationTimesNotifier;

  @override
  void initState() {
    super.initState();

    initializeMixin();
  }

  void initializeMixin() {
    showingPickerNotifier = ValueNotifier<int>(2);
    notificationHourNotifier =
        ValueNotifier<DateTime>(DateTime.now().add(Duration(minutes: 10)));
    notificationTimesNotifier = ValueNotifier<List<DateTime>>([DateTime.now()]);
  }

  void changeShowingPickerValue(int value) {
    showingPickerNotifier.value = value;
  }

  void selectNotificationHour(DateTime selectedTime) {
    notificationHourNotifier.value = selectedTime;
  }

  void selectNotificationDate(List<DateTime> selectedDates) {
    notificationTimesNotifier.value = selectedDates;
  }

  bool checkDateIsToday() {
    return AppDateFunctions.dateFormat(
            dateTime: notificationTimesNotifier.value[0]) ==
        AppDateFunctions.dateFormat(dateTime: DateTime.now());
  }

  bool checkDateIsTomorrow() {
    return AppDateFunctions.dateFormat(
          dateTime: notificationTimesNotifier.value[0],
        ) ==
        AppDateFunctions.dateFormat(
          dateTime: DateTime.now().copyWith(day: (DateTime.now().day + 1)),
        );
  }
}
