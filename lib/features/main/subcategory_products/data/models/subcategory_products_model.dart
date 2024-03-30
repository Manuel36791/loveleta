import 'package:loveleta/core/shared/entities/product_entity.dart';

import '../../../../../core/shared/models/product_model.dart';
import '../../domain/entities/subcategory_products_entity.dart';

class SubCategoryProductsModel extends SubCategoryProductsEntity {
  const SubCategoryProductsModel({
    super.id,
    super.status,
    super.productsList,
  });

  factory SubCategoryProductsModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryProductsModel(
      status: json['status'],
      productsList: json["products"]["data"] == null
          ? []
          : List<ProductEntity>.from(
              json["products"]["data"].map((x) => ProductModel.fromJson(x))),
    );
  }

  static Map<String, dynamic> toJson(
      SubCategoryProductsEntity categoryProductsEntity) {
    return {
      "subcategory_id": categoryProductsEntity.id,
    };
  }
}
