import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';

class SectionTitle extends StatelessWidget {
  final String? sectionTitle;
  final VoidCallback onTap;
  const SectionTitle({super.key, this.sectionTitle, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionTitle!,
          style: CustomTextStyle.kTextStyleF16.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.p8.w,
              vertical: Dimensions.p5.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.pinkPrimary,
              borderRadius: BorderRadius.circular(
                Dimensions.r50,
              ),
            ),
            child: Text(
              "See All",
              style: CustomTextStyle.kTextStyleF14.copyWith(
                color: AppColors.textWhite,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
