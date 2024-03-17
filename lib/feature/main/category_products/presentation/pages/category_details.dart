import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/shared/widgets/product_card.dart';
import '../../../../../core/utils/dimensions.dart';

class CategoryProductsView extends StatefulWidget {
  const CategoryProductsView({super.key});

  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(Dimensions.p16),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 50,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: Dimensions.p16,
                crossAxisSpacing: Dimensions.p16,
                mainAxisExtent: 250.h,
              ),
              itemBuilder: (_, index) => const Align(
                alignment: Alignment.center,
                child: ProductCard(
                  image: "https://picsum.photos/id/106/132/129",
                  title: "Triple Red Flower Arrangement",
                  price: "SAR 760",
                  isExpress: true,
                ),
              ),
            )),
      ),
    );
  }
}
