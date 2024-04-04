

import '../../domain/entities/favorite_product_entity.dart';

class FavoriteProductModel extends FavoriteProductEntity {
  const FavoriteProductModel({
    super.userId,
    super.productId,
    super.status,
    super.msg,
  });

  factory FavoriteProductModel.checkFromJson(Map<String, dynamic> json) {
    return FavoriteProductModel(
      status: json['status'] ,
      msg: json['message'] ,
    );
  }

  factory FavoriteProductModel.addFromJson(Map<String, dynamic> json) {
    return FavoriteProductModel(
      status: json['status'] ,
      msg: json['success'] ,
    );
  }

  static Map<String, dynamic> toJson(FavoriteProductEntity favoriteProductEntity) {
    return {
      'userId': favoriteProductEntity.userId,
      'productId': favoriteProductEntity.productId,
    };
  }

}