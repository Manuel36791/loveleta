import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';

class ProductCard extends StatelessWidget {
  final String? title;
  final String? price;
  final String? image;
  final bool? isFavourite;
  final bool? isExpress;

  const ProductCard({
    super.key,
    this.title,
    this.price,
    this.image,
    this.isFavourite,
    this.isExpress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 129.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  image!,
                  width: 129.w,
                  height: 132.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: Dimensions.r15,
                    child: Icon(
                      MdiIcons.heart,
                      size: 20.sp,
                      color: AppColors.textGrey,
                    ),
                  ),
                )
              ],
            ),
            Gap(5.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: CustomTextStyle.kTextStyleF12,
                ),
                Text(
                  price!,
                  style: CustomTextStyle.kTextStyleF14.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gap(20.h),
                Align(
                  alignment: Alignment.center,
                  child: isExpress == true ? Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.p8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.yellowSecondary,
                      borderRadius: BorderRadius.circular(
                        Dimensions.r50,
                      ),
                    ),
                    child: Text(
                      "Loveleta Express",
                      style: CustomTextStyle.kTextStyleF12.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ) :  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.p8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.greenSecondary,
                      borderRadius: BorderRadius.circular(
                        Dimensions.r50,
                      ),
                    ),
                    child: Text(
                      "Free Delivery",
                      style: CustomTextStyle.kTextStyleF12.copyWith(
                        color: AppColors.textWhite,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
