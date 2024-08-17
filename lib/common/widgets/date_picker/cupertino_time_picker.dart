import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/core/constants/colors/app_dark_colors.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/font_weight/app_font_weight.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';

class AppCupertinoTimePicker extends StatefulWidget {
  AppCupertinoTimePicker({
    super.key,
    this.initialDateTime,
    this.minDateTime,
    this.maxDateTime,
    required this.onConfirm,
    this.onChange,
    this.withHour = true,
    this.minuteDivider = 1,
  });
  final Function(DateTime)? onChange;
  final Function(DateTime) onConfirm;
  DateTime? initialDateTime;
  DateTime? minDateTime;
  DateTime? maxDateTime;
  int? minuteDivider;
  bool? withHour;

  @override
  State<AppCupertinoTimePicker> createState() => _AppCupertinoTimePickerState();
}

class _AppCupertinoTimePickerState extends State<AppCupertinoTimePicker> {
  DateTime? currentDateTime;

  @override
  void initState() {
    super.initState();
    widget.initialDateTime = widget.initialDateTime ?? DateTime.now();
    currentDateTime = widget.initialDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return TimePickerWidget(
      initDateTime: widget.initialDateTime,
      minDateTime: widget.minDateTime,
      maxDateTime: widget.maxDateTime,
      minuteDivider: widget.minuteDivider!,
      dateFormat: widget.withHour == true ? 'HH:mm' : 'mm',
      locale: DateTimePickerLocale.en_us,
      onChange: (dateTime, selectedIndex) {
        currentDateTime = dateTime;
        if (widget.onChange.isNotNull) {
          widget.onChange!(dateTime);
        }
      },
      pickerTheme: DateTimePickerTheme(
        backgroundColor: Colors.transparent,
        title: SizedBox(),
        itemHeight: 32.h,
        pickerHeight: 180.h,
        itemTextStyle: AppThemes.currentTheme.textTheme.bodySmall?.copyWith(
          fontWeight: AppFontWeight.medium.value,
        ),
      ),
    );
  }

  Widget _buildIcon({required IconData icon, Function()? onTap}) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Icon(
        icon,
        size: 24.h,
        color: AppThemes.getColorByBrightness(
          lightColor: AppLightColors.black,
          darkColor: AppDarkColors.grey,
        ),
      ),
    );
  }
}
