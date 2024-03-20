import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/dimensions.dart';
import '../widgets/category_list_tile.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {

  final categories = [
    "Flowers",
    "Best Sellers",
    "Gifts",
    "Cakes",
    "Flowers",
    "Best Sellers",
    "Gifts",
    "Cakes",
    "Flowers",
    "Best Sellers",
    "Gifts",
    "Cakes",
  ];
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
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (ctx, index) {
                    return CategoryListTile(
                      category: categories[index],
                      image: AppImages.appLogoSvg,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
