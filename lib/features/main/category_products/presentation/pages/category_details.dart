import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared/entities/product_entity.dart';
import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/shared/widgets/product_card.dart';
import '../../../../../core/utils/app_images.dart';
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
              itemBuilder: (_, index) => Align(
                alignment: Alignment.center,
                child: ProductCard(
                  product: ProductEntity(
                    id: 1,
                    category: "category",
                    nameEn: "Product",
                    nameAr: "منتج",
                    descriptionEn: "description",
                    descriptionAr: "وصف",
                    mainImage: "https://picsum.photos/id/106/132/129",
                    images: [
                      AppImages.placeholderImg,
                      AppImages.placeholderImg,
                      AppImages.placeholderImg,
                      AppImages.placeholderImg,
                    ],
                    giftDetailsEn: const [
                      "Gift Detail 1",
                      "Gift Detail 2",
                      "Gift Detail 3",
                      "Gift Detail 4",
                    ],
                    giftDetailsAr: const [
                      "تفاصيل الهدية 1",
                      "تفاصيل الهدية 2",
                      "تفاصيل الهدية 3",
                      "تفاصيل الهدية 4",
                    ],
                    color: const [
                      "Red",
                      "Green",
                      "Blue",
                    ],
                    isExpress: false,
                    inStock: false,
                    sku: "SKU",
                    price: 100,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
