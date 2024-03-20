import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';

class CategoryContainer extends StatelessWidget {
  final String? title;
  final String? image;

  const CategoryContainer({
    super.key,
    this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 52.h,
          width: 72.w,
          padding: const EdgeInsets.all(Dimensions.p8),
          decoration: BoxDecoration(
            color: AppColors.pinkPrimary,
            borderRadius: BorderRadius.circular(
              Dimensions.r5,
            ),
          ),
          child: SvgPicture.asset(
            image!,
            fit: BoxFit.contain,
          ),
        ),
        Gap(5.h),
        Text(
          title!,
          style: CustomTextStyle.kTextStyleF14,
        ),
      ],
    );
  }
}
