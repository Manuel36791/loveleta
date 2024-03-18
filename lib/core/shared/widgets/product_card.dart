import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../router/router.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/dimensions.dart';

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
      onTap: () {
        context.pushNamed(productDetailsPageRoute);
      },
      child: SizedBox(
        width: 129.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: image!,
                  width: 129.w,
                  height: 132.h,
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: double.infinity,
                      height: 132.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                        child: CircularProgressIndicator(
                          color: AppColors.pinkSecondary,
                          value: downloadProgress.progress,
                        ),
                      ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
