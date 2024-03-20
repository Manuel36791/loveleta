import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.p16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: AppImages.placeholderImg,
                        width: 312.w,
                        height: 312.h,
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            width: double.infinity,
                            height: 132.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    AppImages.placeholderImg),
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
                          radius: Dimensions.r20,
                          child: Icon(
                            MdiIcons.heart,
                            size: 25.sp,
                            color: AppColors.textGrey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Gap(15.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        10,
                        (index) {
                          return Image.network(
                            AppImages.placeholderImg,
                            height: 60.h,
                            width: 66.w,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Gap(15.h),
                Text(
                  "Triple Red Flower Arrangement ",
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(10.h),
                Text(
                  "Roses: Red roses, in particular, are classic symbols of love and desire. They have been used for centuries to convey romantic sentiments and are often exchanged on special occasions like anniversaries, weddings, and Valentine's Day.",
                  style: CustomTextStyle.kTextStyleF12,
                ),
                Gap(15.h),
                Text(
                  "Gift Details",
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(10.h),
                Text(
                  "• Numbers: 40 Fresh Roses",
                  style: CustomTextStyle.kTextStyleF12,
                ),
                Text(
                  "• Presented as a hand bouquet",
                  style: CustomTextStyle.kTextStyleF12,
                ),
                Text(
                  "• Available colors: Pink, red, white or Yellow",
                  style: CustomTextStyle.kTextStyleF12,
                ),
                Text(
                  "• Height 50, width 25 cm",
                  style: CustomTextStyle.kTextStyleF12,
                ),
                Gap(15.h),
                Text(
                  "Availability: In Stock",
                  style: CustomTextStyle.kTextStyleF16,
                ),
                Text(
                  "SKU: Lovelita56235",
                  style: CustomTextStyle.kTextStyleF16,
                ),
                Gap(15.h),
                DropdownMenu(
                  width: context.queryWidth.w,
                  label: const Text("Color"),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 0, label: "Red"),
                    DropdownMenuEntry(value: 1, label: "Green"),
                    DropdownMenuEntry(value: 2, label: "Blue"),
                  ],
                ),
                Gap(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SAR 760",
                      style: CustomTextStyle.kTextStyleF16.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (qty <= 1) {
                              qty;
                            } else {
                              setState(() {
                                qty--;
                              });
                            }
                          },
                          icon: Icon(
                            MdiIcons.minusBox,
                            color: AppColors.textGrey,
                            size: 38.sp,
                          ),
                        ),
                        Gap(5.w),
                        Text("$qty",
                          style: CustomTextStyle.kTextStyleF16,
                        ),
                        Gap(5.w),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              qty++;
                            });
                          },
                          icon: Icon(
                            MdiIcons.plusBox,
                            color: AppColors.pinkPrimary,
                            size: 38.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(15.h),
                CustomBtn(
                  label: "Add to cart",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
