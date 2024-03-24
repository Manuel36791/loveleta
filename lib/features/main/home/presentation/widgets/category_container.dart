import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:loveleta/core/utils/extensions.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../categories/domain/entities/category_entity.dart';

class CategoryContainer extends StatelessWidget {
  final CategoryEntity category;

  const CategoryContainer({
    super.key,
    required this.category,
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
          child: CachedNetworkImage(
            imageUrl: "${AppConstants.imageUrl}${category.image}",
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.contain,
          ),
        ),
        Gap(5.h),
        Text(
          Intl.getCurrentLocale() == "en"
              ? category.nameEn!.isNullOrEmpty()
              : category.nameAr!.isNullOrEmpty(),
          style: CustomTextStyle.kTextStyleF14,
        ),
      ],
    );
  }
}
