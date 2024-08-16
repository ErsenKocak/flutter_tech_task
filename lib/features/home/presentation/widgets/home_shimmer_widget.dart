import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech_task/common/extensions/sized_box/sized_box_extension.dart';
import 'package:flutter_tech_task/common/widgets/shimmer/shimmer_generated/shimmer_generated.dart';
import 'package:flutter_tech_task/common/widgets/shimmer/shimmer_sized/shimmer_sized.dart';
import 'package:flutter_tech_task/common/widgets/shimmer/shimmer_text/shimmer_text.dart';

class HomeShimmerWidget extends StatelessWidget {
  const HomeShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          12.sbxh,
          AppShimmerText(
            maxLine: 1,
          ),
          8.sbxh,
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => AppShimmerGenerated(
              borderRadius: 12,
              height: 100.sh,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => _buildBookShimmer,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget get _buildBookShimmer {
    return Row(
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
    );
  }
}
