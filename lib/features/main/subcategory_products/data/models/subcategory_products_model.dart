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
      productsList: json['products'] == null
          ? json['products'].map((item) => ProductModel.fromJson(item)).toList()
          : [],
    );
  }

  static Map<String, dynamic> toJson(
      SubCategoryProductsEntity categoryProductsEntity) {
    return {
      "subcategory_id": categoryProductsEntity.id,
    };
  }
}
