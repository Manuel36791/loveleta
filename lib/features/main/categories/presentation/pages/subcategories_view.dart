import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/utils/dimensions.dart';
import '../widgets/subcategory_list_tile.dart';

class SubCategoriesView extends StatelessWidget {
  final List<dynamic> subcategories;

  const SubCategoriesView({super.key, required this.subcategories,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.p16),
          child:  ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: subcategories.length,
          itemBuilder: (ctx, index) {
            return SubCategoryListTile(
              subCategory: subcategories[index],
            );
          },
        ),
        ),
      ),
    );
  }
}
