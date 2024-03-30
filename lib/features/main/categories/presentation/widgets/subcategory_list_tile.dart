import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/router/router.dart';
import '../../../../../core/shared/arguments.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../domain/entities/subcategory_entity.dart';

class SubCategoryListTile extends StatelessWidget {
  final SubCategoryEntity subCategory;

  const SubCategoryListTile({
    super.key,
    required this.subCategory,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          categoryProductsPageRoute,
          arguments: CategoryProductsArgs(id: subCategory.id!),
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: "${AppConstants.imageUrl}${subCategory.image}",
                    height: 26.h,
                    width: 26.w,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Gap(10.w),
                  Text(
                    Intl.getCurrentLocale() == "en"
                        ? subCategory.nameEn!.isNullOrEmpty()
                        : subCategory.nameAr!.isNullOrEmpty(),
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ],
              ),
              Icon(
                Intl.getCurrentLocale() == "en"
                    ? MdiIcons.chevronRight
                    : MdiIcons.chevronLeft,
                size: 26.sp,
              )
            ],
          ),
          Divider(thickness: 1.h),
        ],
      ),
    );
  }
}
