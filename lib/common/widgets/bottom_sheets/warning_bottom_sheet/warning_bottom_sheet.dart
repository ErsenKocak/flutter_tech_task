import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/common/extensions/sized_box/sized_box_extension.dart';
import 'package:flutter_tech_task/common/widgets/buttons/elevated_button/elevated_button.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/generated/assets.gen.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';

class WarningBottomSheetWidget extends StatelessWidget {
  const WarningBottomSheetWidget({
    super.key,
    this.headerMessage,
    this.bodyMessage,
  });
  final String? bodyMessage;
  final String? headerMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          24.h.sbxh,
          _buildInfoImage,
          24.h.sbxh,
          _buildHeaderMessage,
          _buildBodyMessage,
          32.h.sbxh,
          _buildCloseButton(context),
        ],
      ),
    );
  }

  Widget get _buildInfoImage {
    return AppThemes.brightness == Brightness.light
        ? Assets.images.bottomSheets.imgBigWarning.image(height: 80.h)
        : Assets.images.bottomSheets.imgBigWarningDark.image(height: 80.h);
  }

  Widget get _buildHeaderMessage {
    return Text(
      headerMessage ?? LocaleKeys.ErrorMessages_GlobalError.tr(),
      textAlign: TextAlign.center,
      style: AppThemes.currentTheme.textTheme.bodyLarge,
    );
  }

  Widget get _buildBodyMessage {
    if (bodyMessage.isNullOrEmpty) return const SizedBox();

    return Text(
      bodyMessage ?? '',
      textAlign: TextAlign.center,
      style: AppThemes.currentTheme.textTheme.bodySmall
          ?.copyWith(color: AppLightColors.secondaryTextColor),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return AppElevatedButton(
      onPressed: () => Navigator.pop(context),
      buttonText: LocaleKeys.Global_Close.tr(),
    );
  }
}
