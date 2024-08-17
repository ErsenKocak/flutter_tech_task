import 'package:flutter/material.dart';
import 'package:flutter_tech_task/common/extensions/sized_box/sized_box_extension.dart';
import 'package:flutter_tech_task/common/widgets/divider/app_divider.dart';
import 'package:flutter_tech_task/core/constants/colors/app_dark_colors.dart';
import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/core/constants/theme/app_themes.dart';
import 'package:flutter_tech_task/core/enums/app_padding/app_padding.dart';

class PublisherCardWidget extends StatelessWidget {
  const PublisherCardWidget(
      {super.key, required this.publisher, required this.content});

  final String publisher;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingAllDefault,
      margin: context.paddingVerticalDefault,
      decoration: _buildDecoration,
      child: _buildBody,
    );
  }

  BoxDecoration get _buildDecoration {
    return BoxDecoration(
      color: AppThemes.getColorByBrightness(
          lightColor: AppLightColors.white,
          darkColor: AppDarkColors.secondaryDarkColor),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
          color: AppThemes.getColorByBrightness(
              lightColor: AppLightColors.darkWhite,
              darkColor: AppDarkColors.secondaryDarkColor)),
    );
  }

  Widget get _buildBody {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              publisher,
              style: AppThemes.currentTheme.textTheme.bodySmall,
            ),
          ],
        ),
        8.sbxh,
        AppDivider(),
        8.sbxh,
        content
      ],
    );
  }
}
