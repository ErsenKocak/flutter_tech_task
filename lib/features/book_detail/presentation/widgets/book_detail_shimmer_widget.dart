import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/common/extensions/sized_box/sized_box_extension.dart';
import 'package:flutter_tech_task/common/widgets/shimmer/shimmer_generated/shimmer_generated.dart';
import 'package:flutter_tech_task/common/widgets/shimmer/shimmer_sized/shimmer_sized.dart';
import 'package:flutter_tech_task/common/widgets/shimmer/shimmer_text/shimmer_text.dart';
import 'package:flutter_tech_task/core/enums/app_padding/app_padding.dart';

class BookDetailShimmerWidget extends StatelessWidget {
  const BookDetailShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: AppShimmerGenerated(
        borderRadius: 12,
        height: 100.sh,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            12.sbxh,
            Row(
              children: [
                AppShimmerSized(
                  borderRadius: 12,
                  height: 60.h,
                  width: 0.25.sw,
                ),
                Expanded(
                  child: AppShimmerText(
                    maxLine: 3,
                  ),
                ),
              ],
            ),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildBookShimmer,
            )
          ],
        ),
      ),
    );
  }

  Widget get _buildBookShimmer {
    return Row(
      children: [
        Expanded(
          child: AppShimmerText(
            maxLine: 3,
          ),
        ),
      ],
    );
  }
}
