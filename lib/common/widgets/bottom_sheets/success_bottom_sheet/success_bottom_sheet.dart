import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/common/extensions/sized_box/sized_box_extension.dart';
import 'package:flutter_tech_task/common/widgets/buttons/elevated_button/elevated_button.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/core/router/app_router.dart';
import 'package:flutter_tech_task/generated/assets.gen.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';

class SuccessBottomSheetWidget extends StatelessWidget {
  const SuccessBottomSheetWidget({
    super.key,
    this.headerMessage,
    this.bodyMessage,
    this.onLaterPop,
    this.isViewPop = false,
    this.viewPopParameter,
  });
  final String? bodyMessage;
  final String? headerMessage;
  final Function()? onLaterPop;
  final bool? isViewPop;
  final dynamic viewPopParameter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildInfoImage,
        24.h.sbxh,
        _buildHeaderMessage,
        _buildBodyMessage,
        32.h.sbxh,
        _buildCloseButton(context),
        8.h.sbxh,
      ],
    );
  }

  Widget get _buildInfoImage {
    return AppThemes.brightness == Brightness.light
        ? Assets.images.bottomSheets.imgBigSuccess.image(height: 80.h)
        : Assets.images.bottomSheets.imgBigSuccessDark.image(height: 80.h);
  }

  Widget get _buildHeaderMessage {
    return Text(
      headerMessage ?? LocaleKeys.Global_OperationCompletedSuccessfully.tr(),
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
          bodyMessage ?? '',
          textAlign: TextAlign.center,
          style: AppThemes.currentTheme.textTheme.labelSmall
              ?.copyWith(color: AppLightColors.secondaryTextColor),
        ),
      ],
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return AppElevatedButton(
      onPressed: () {
        Navigator.pop(context);
        if (isViewPop == true) {
          AppRouter.pop(value: viewPopParameter);
        }
        if (onLaterPop != null) {
          onLaterPop!();
        }
      },
      buttonText: LocaleKeys.Global_Close.tr(),
    );
  }
}
