import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/common/extensions/sized_box/sized_box_extension.dart';
import 'package:flutter_tech_task/common/widgets/buttons/elevated_button/elevated_button.dart';
import 'package:flutter_tech_task/common/widgets/buttons/elevated_outline_button/elevated_outline_button.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/generated/assets.gen.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';

class QuestionBottomSheetWidget extends StatelessWidget {
  const QuestionBottomSheetWidget({
    super.key,
    required this.headerMessage,
    this.bodyMessage,
    this.cancelButtonText,
    this.confirmButtonText,
    required this.onConfirmFunction,
  });
  final String? bodyMessage;
  final String headerMessage;
  final String? cancelButtonText;
  final String? confirmButtonText;
  final Function() onConfirmFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildInfoImage,
        24.h.sbxh,
        _buildheaderMessage,
        _buildBodyMessage,
        32.h.sbxh,
        _buildFooter(context),
        8.h.sbxh,
      ],
    );
  }

  Widget get _buildInfoImage {
    return AppThemes.brightness == Brightness.light
        ? Assets.images.bottomSheets.imgBigWarning.image(height: 80.h)
        : Assets.images.bottomSheets.imgBigWarningDark.image(height: 80.h);
  }

  Widget get _buildheaderMessage {
    return Text(
      headerMessage,
      textAlign: TextAlign.center,
      style: AppThemes.currentTheme.textTheme.bodyLarge,
    );
  }

  Widget get _buildBodyMessage {
    if (bodyMessage.isNullOrEmpty) return const SizedBox();

    return Column(
      children: [
        24.h.sbxh,
        Text(
          bodyMessage ?? LocaleKeys.ErrorMessages_GlobalError.tr(),
          textAlign: TextAlign.center,
          style: AppThemes.currentTheme.textTheme.labelSmall
              ?.copyWith(color: AppLightColors.secondaryTextColor),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildCancelButton(context),
        10.0.w.sbxw,
        _buildContinueButton(context)
      ],
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return Expanded(
      child: AppElevatedOutlineButton(
        onPressed: () => Navigator.pop(context),
        buttonText: LocaleKeys.Global_Cancel.tr(),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Expanded(
      child: AppElevatedButton(
        buttonText: LocaleKeys.Global_Continue.tr(),
        onPressed: () async {
          Navigator.pop(context);
          await onConfirmFunction();
        },
      ),
    );
  }
}
