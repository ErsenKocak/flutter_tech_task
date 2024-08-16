import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/common/extensions/sized_box/sized_box_extension.dart';
import 'package:flutter_tech_task/common/functions/date/app_date_functions.dart';
import 'package:flutter_tech_task/common/widgets/buttons/elevated_button/elevated_button.dart';
import 'package:flutter_tech_task/common/widgets/date_picker/app_date_picker.dart';
import 'package:flutter_tech_task/common/widgets/date_picker/cupertino_time_picker.dart';
import 'package:flutter_tech_task/common/widgets/notification/notification_time_selecter_mixin.dart';
import 'package:flutter_tech_task/core/constants/colors/app_dark_colors.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/font_weight/app_font_weight.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/core/enums/date/date_format_types.dart';
import 'package:flutter_tech_task/core/router/app_router.dart';
import 'package:flutter_tech_task/core/utils/theme/text_theme/text_theme.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';

class NotificationTimeSelecterWidget extends StatefulWidget {
  const NotificationTimeSelecterWidget({super.key, required this.onSelect});
  final Function(List<DateTime> notificationDates, DateTime notificationHour)
      onSelect;

  @override
  State<NotificationTimeSelecterWidget> createState() =>
      _NotificationTimeSelecterWidgetState();
}

class _NotificationTimeSelecterWidgetState
    extends State<NotificationTimeSelecterWidget>
    with NotificationTimeSelecterMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildNotificationHourAndTimeLabels,
        8.sbxh,
        _buildShowingPicker,
        12.sbxh,
        _buildSelectButton
      ],
    );
  }

  Widget get _buildNotificationHourAndTimeLabels {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAreaTitle(
                  title: LocaleKeys.Notification_NotificationDate.tr()),
              _buildNotificationTime,
            ],
          ),
        ),
        Spacer(),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAreaTitle(
                  title: LocaleKeys.Notification_NotificationHour.tr()),
              _buildNotificationHour,
            ],
          ),
        ),
      ],
    );
  }

  Widget get _buildShowingPicker {
    return GestureDetector(
      onTap: () {
        /// Sayfaya parent olarak Gesture verip popupları kapatmamız nedeniyle
        /// Time Picker ve Date Picker içerisinde ki boşluklara tıklandığında da
        /// Kapanma yaşanıyordu burdaki Gesture'ın eklenmesinin tek sebebi:
        /// Parent'taki onTap'i ezerek kapanmanın önüne geçmek
      },
      child: ValueListenableBuilder(
        valueListenable: showingPickerNotifier,
        builder: (context, pickerNotifierValue, child) {
          if (pickerNotifierValue == 1) {
            return _buildNotificationHourPicker;
          } else if (pickerNotifierValue == 2) {
            return _buildNotificationTimePicker;
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget get _buildNotificationHour {
    return GestureDetector(
      onTap: () => changeShowingPickerValue(1),
      child: ValueListenableBuilder(
        valueListenable: notificationHourNotifier,
        builder: (context, notificationHourNotifierValue, child) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8.w),
            margin: EdgeInsets.only(top: 8.h),
            decoration: BoxDecoration(
              color: AppThemes.getColorByBrightness(
                  lightColor: AppLightColors.white,
                  darkColor: AppDarkColors.secondaryDarkColor),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppLightColors.strokeGrey, width: 1),
            ),
            child: Center(
              child: Text(
                AppDateFunctions.dateFormat(
                  dateTime: notificationHourNotifierValue,
                  dateFormat: DateFormatTypes.HHSmm,
                ).toString(),
                style: AppThemes.currentTheme.textTheme.bodyMedium,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget get _buildNotificationHourPicker {
    return Container(
      width: 144.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppThemes.getColorByBrightness(
          lightColor: AppLightColors.white,
          darkColor: AppDarkColors.secondaryDarkColor,
        ),
        borderRadius: BorderRadius.circular(8),
        border: AppThemes.brightness == Brightness.light
            ? Border.all(color: AppLightColors.strokeGrey, width: 1)
            : null,
      ),
      child: AppCupertinoTimePicker(
        initialDateTime: notificationHourNotifier.value,
        onChange: selectNotificationHour,
        onConfirm: selectNotificationHour,
      ),
    );
  }

  Widget get _buildNotificationTime {
    return GestureDetector(
      onTap: () => changeShowingPickerValue(2),
      child: ValueListenableBuilder(
        valueListenable: notificationTimesNotifier,
        builder: (context, notificationDateNotifierValue, child) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8.w),
            margin: EdgeInsets.only(top: 8.h),
            decoration: BoxDecoration(
              color: AppThemes.brightness == Brightness.light
                  ? AppLightColors.white
                  : AppDarkColors.secondaryDarkColor,
              border: Border.all(color: AppLightColors.strokeGrey, width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: _buildNotificationTimeLabelText,
            ),
          );
        },
      ),
    );
  }

  Widget get _buildNotificationTimeLabelText {
    bool isToday = false;
    bool isTomorrow = false;
    if (notificationTimesNotifier.value.length == 1) {
      isToday = checkDateIsToday();

      isTomorrow = checkDateIsTomorrow();

      if (isToday) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.Date_Today.tr(),
              style: AppThemes.currentTheme.textTheme.bodyMedium,
            ),
          ],
        );
      } else if (isTomorrow) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.Date_Tomorrow.tr(),
              style: AppThemes.currentTheme.textTheme.bodyMedium,
            ),
          ],
        );
      } else {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppDateFunctions.dateFormat(
                      dateTime: notificationTimesNotifier.value[0])
                  .toString(),
              style: AppThemes.currentTheme.textTheme.bodyMedium,
            ),
          ],
        );
      }
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LocaleKeys.Global_Multiple.tr(),
            style: AppThemes.currentTheme.textTheme.bodyMedium,
          ),
        ],
      );
    }
  }

  Widget get _buildNotificationTimePicker {
    return Container(
      decoration: BoxDecoration(
        color: AppThemes.getColorByBrightness(
          lightColor: AppLightColors.white,
          darkColor: AppDarkColors.secondaryDarkColor,
        ),
        border: AppThemes.brightness == Brightness.light
            ? Border.all(color: AppLightColors.strokeGrey, width: 1)
            : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: AppDatePicker(
        calendarDatePickerType: CalendarDatePicker2Type.multi,
        selectableMinimumDate: DateTime.now(),
        selectedDates: notificationTimesNotifier.value,
        onValueChanged: (List<DateTime?> selectedDates) {
          if (selectedDates.isNotEmpty && selectedDates[0] != null) {
            List<DateTime> dates = [];

            selectedDates.forEach((element) {
              if (element != null) {
                dates.add(element);
              }
            });

            selectNotificationDate(dates);
          }
        },
      ),
    );
  }

  Widget _buildAreaTitle({required title, Widget? suffix = const SizedBox()}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppThemes.currentTheme.textTheme.bodyMedium,
        ),
        suffix!,
      ],
    );
  }

  Widget get _buildSelectButton {
    return ValueListenableBuilder(
      valueListenable: notificationTimesNotifier,
      builder: (context, value, child) {
        return AppElevatedButton(
          buttonText: LocaleKeys.Global_Finish.tr(),
          onPressed: notificationTimesNotifier.value.isEmpty
              ? null
              : () {
                  AppRouter.pop();
                  widget.onSelect(notificationTimesNotifier.value,
                      notificationHourNotifier.value);
                },
        );
      },
    );
  }
}
