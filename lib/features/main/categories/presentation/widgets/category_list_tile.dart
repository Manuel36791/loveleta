import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/router/router.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CategoryListTile extends StatelessWidget {
  final String category;
  final String image;
  const CategoryListTile({super.key, required this.category, required this.image,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(categoryProductsPageRoute);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    image,
                    height: 26.h,
                    width: 26.w,
                  ),
                  Gap(10.w),
                  Text(
                    category,
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ],
              ),
              Icon(MdiIcons.chevronRight, size: 26.sp,)
            ],
          ),
          Divider(thickness: 1.h),
        ],
      ),
    );
  }
}
