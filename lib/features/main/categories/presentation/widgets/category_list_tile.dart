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
import '../../domain/entities/category_entity.dart';

class CategoryListTile extends StatelessWidget {
  final CategoryEntity category;

  const CategoryListTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          subCategoriesPageRoute,
          arguments: SubCategoryArgs(subCategories: category.subCategories!),
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
                    imageUrl: "${AppConstants.imageUrl}${category.image}",
                    height: 26.h,
                    width: 26.w,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Gap(10.w),
                  Text(
                    Intl.getCurrentLocale() == "en"
                        ? category.nameEn!.isNullOrEmpty()
                        : category.nameAr!.isNullOrEmpty(),
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
