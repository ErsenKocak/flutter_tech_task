import 'package:calendar_date_picker2/calendar_date_picker2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/font_weight/app_font_weight.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';

class AppDatePicker extends StatefulWidget {
  AppDatePicker({
    super.key,
    this.calendarDatePickerType,
    this.selectableMinimumDate,
    this.selectableMaximumDate,
    this.selectedDates,
    this.onDisplayedMonthChanged,
    this.onValueChanged,
    this.dayBuilder,
    this.disableModePicker = false,
    this.selectedRangeHighlightColor,
  });
  final CalendarDatePicker2Type? calendarDatePickerType;
  final DateTime? selectableMinimumDate;
  final DateTime? selectableMaximumDate;
  final List<DateTime?>? selectedDates;
  final Function(DateTime)? onDisplayedMonthChanged;
  final Function(List<DateTime?>)? onValueChanged;
  final bool? disableModePicker;
  Color? selectedRangeHighlightColor;

  Widget? Function({
    required DateTime date,
    BoxDecoration? decoration,
    bool? isDisabled,
    bool? isSelected,
    bool? isToday,
    TextStyle? textStyle,
  })? dayBuilder;

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CalendarDatePicker2(
      config: CalendarDatePicker2Config(
        centerAlignModePicker: true,
        calendarType:
            widget.calendarDatePickerType ?? CalendarDatePicker2Type.single,
        calendarViewMode: CalendarDatePicker2Mode.day,
        firstDate: widget.selectableMinimumDate,
        lastDate: widget.selectableMaximumDate,
        disableModePicker: widget.disableModePicker,
        controlsHeight: widget.disableModePicker == true ? 0 : null,
        nextMonthIcon: widget.disableModePicker == true
            ? const SizedBox()
            : const Icon(Icons.keyboard_arrow_right_rounded),
        lastMonthIcon: widget.disableModePicker == true
            ? const SizedBox()
            : const Icon(Icons.keyboard_arrow_left_rounded),
        customModePickerIcon: const Icon(Icons.keyboard_arrow_down_rounded),
        selectedRangeHighlightColor: widget.selectedRangeHighlightColor ??
            AppLightColors.primaryPink.withOpacity(0.2),
        weekdayLabelTextStyle: AppThemes.currentTheme.textTheme.bodySmall,
        dayTextStyle: AppThemes.currentTheme.textTheme.bodySmall,
        selectedDayHighlightColor: AppLightColors.primaryPink,
        selectedDayTextStyle:
            AppThemes.currentTheme.textTheme.bodyMedium?.copyWith(
          color: AppLightColors.white,
          fontWeight: AppFontWeight.semiBold.value,
        ),
        controlsTextStyle: AppThemes.currentTheme.textTheme.bodyMedium
            ?.copyWith(fontWeight: AppFontWeight.medium.value),
        yearTextStyle: AppThemes.currentTheme.textTheme.bodyMedium,
        selectedYearTextStyle: AppThemes.currentTheme.textTheme.bodyMedium
            ?.copyWith(fontWeight: AppFontWeight.medium.value),
        dayBuilder: widget.dayBuilder ?? null,
      ),
      value: widget.selectedDates ?? [],
      onDisplayedMonthChanged: (final DateTime date) {
        // log('onDisplayedMonthChanged -- $date');
        if (widget.onDisplayedMonthChanged != null)
          widget.onDisplayedMonthChanged!(date);
      },
      onValueChanged: (final List<DateTime?> dates) {
        if (widget.onValueChanged != null) widget.onValueChanged!(dates);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
