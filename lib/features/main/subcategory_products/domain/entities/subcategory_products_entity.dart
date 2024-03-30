import 'package:equatable/equatable.dart';

import '../../../../../core/shared/entities/product_entity.dart';

class SubCategoryProductsEntity extends Equatable {
  final num? id;
  final String? status;
  final List<ProductEntity>? productsList; // List<Product>

  const SubCategoryProductsEntity({
    this.id,
    this.status,
    this.productsList,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        productsList,
      ];
}
