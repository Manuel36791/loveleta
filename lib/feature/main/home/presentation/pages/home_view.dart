import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';
import '../widgets/category_container.dart';
import '../widgets/product_card.dart';
import '../widgets/section_title.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.p16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(20.h),
                Container(
                  width: context.queryWidth.w,
                  padding: const EdgeInsets.all(Dimensions.p8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(Dimensions.r5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.magnify,
                        size: Dimensions.f22,
                      ),
                      Gap(10.w),
                      Text(
                        "Search For gifts, flowers Cakes...",
                        style: CustomTextStyle.kTextStyleF14.copyWith(
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        10,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(Dimensions.p10),
                            child: CategoryContainer(
                              image: AppImages.appLogoSvg,
                              title: "Balloons",
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
                const SectionTitle(
                  sectionTitle: "New Arrivals",
                ),
                Gap(20.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        10,
                        (index) {
                          return const Padding(
                            padding: EdgeInsets.all(Dimensions.p10),
                            child: ProductCard(
                              image: "https://picsum.photos/id/106/132/129",
                              title: "Triple Red Flower Arrangement",
                              price: "SAR 760",
                              isExpress: true,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
                const SectionTitle(
                  sectionTitle: "Best Sellers",
                ),
                Gap(20.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        10,
                        (index) {
                          return const Padding(
                            padding: EdgeInsets.all(Dimensions.p10),
                            child: ProductCard(
                              image: "https://picsum.photos/id/106/132/129",
                              title: "Triple Red Flower Arrangement",
                              price: "SAR 760",
                              isExpress: false,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
                const SectionTitle(
                  sectionTitle: "Valentine’s Day Gifts",
                ),
                Gap(20.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        10,
                        (index) {
                          return const Padding(
                            padding: EdgeInsets.all(Dimensions.p10),
                            child: ProductCard(
                              image: "https://picsum.photos/id/106/132/129",
                              title: "Triple Red Flower Arrangement",
                              price: "SAR 760",
                              isExpress: true,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
                const SectionTitle(
                  sectionTitle: "Gift Bundles",
                ),
                Gap(20.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        10,
                        (index) {
                          return const Padding(
                            padding: EdgeInsets.all(Dimensions.p10),
                            child: ProductCard(
                              image: "https://picsum.photos/id/106/132/129",
                              title: "Triple Red Flower Arrangement",
                              price: "SAR 760",
                              isExpress: false,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
                const SectionTitle(
                  sectionTitle: "Flowers",
                ),
                Gap(20.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        10,
                        (index) {
                          return const Padding(
                            padding: EdgeInsets.all(Dimensions.p10),
                            child: ProductCard(
                              image: "https://picsum.photos/id/106/132/129",
                              title: "Triple Red Flower Arrangement",
                              price: "SAR 760",
                              isExpress: true,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
                const SectionTitle(
                  sectionTitle: "Cakes & Gourmet",
                ),
                Gap(20.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        10,
                        (index) {
                          return const Padding(
                            padding: EdgeInsets.all(Dimensions.p10),
                            child: ProductCard(
                              image: "https://picsum.photos/id/106/132/129",
                              title: "Triple Red Flower Arrangement",
                              price: "SAR 760",
                              isExpress: false,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
                const SectionTitle(
                  sectionTitle: "Perfumes",
                ),
                Gap(20.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        10,
                        (index) {
                          return const Padding(
                            padding: EdgeInsets.all(Dimensions.p10),
                            child: ProductCard(
                              image: "https://picsum.photos/id/106/132/129",
                              title: "Triple Red Flower Arrangement",
                              price: "SAR 760",
                              isExpress: true,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
