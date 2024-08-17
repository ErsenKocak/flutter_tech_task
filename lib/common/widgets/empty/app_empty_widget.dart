import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/common/extensions/sized_box/sized_box_extension.dart';
import 'package:flutter_tech_task/common/widgets/buttons/elevated_button/elevated_button.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/core/enums/app_padding/app_padding.dart';
import 'package:flutter_tech_task/generated/assets.gen.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget(
      {super.key,
      this.image,
      this.title,
      this.subTitle,
      this.onPress,
      this.buttonText})
      // Eğer onPress verildiyse buttonText verilmesi zorunlu kılınıyor.
      : assert(onPress == null || buttonText != null);
  final Widget? image;
  final String? title;
  final String? subTitle;
  final Function? onPress;
  final String? buttonText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.paddingAllHigh2,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildEmptyImage,
            24.sbxh,
            _buildTitle,
            _buildSubTitle,
            24.sbxh,
            _buildFooterButton
          ],
        ),
      ),
    );
  }

  Widget get _buildEmptyImage {
    return image ??
        Assets.images.widgets.imageEmpty.image(
          width: 0.50.sw,
        );
  }

  Widget get _buildTitle {
    return Text(
      title ?? LocaleKeys.ErrorMessages_EmptyWidgetInfo.tr(),
      textAlign: TextAlign.center,
      style: AppThemes.currentTheme.textTheme.bodyMedium,
    );
  }

  Widget get _buildSubTitle {
    if (subTitle.isNullOrEmpty) return const SizedBox();
    return Column(
      children: [
        12.sbxh,
        Text(
          subTitle ?? '',
          textAlign: TextAlign.center,
          style: AppThemes.currentTheme.textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget get _buildFooterButton {
    if (onPress == null) return const SizedBox();
    return AppElevatedButton(
      buttonText: buttonText ?? '',
      onPressed: () {
        onPress!();
      },
    );
  }
}
