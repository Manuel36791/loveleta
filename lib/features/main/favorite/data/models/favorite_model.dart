import '../../../../../../core/shared/models/product_model.dart';
import '../../../../../core/shared/entities/product_entity.dart';
import '../../domain/entities/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  const FavoriteModel({
    super.userId,
    super.page,
    super.products,
    super.status,
    super.message,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      products: json['data'] == null ? [] : List<ProductEntity>.from(
          json['data'].map((x) => ProductModel.fromJson(x))),
      status: json['status'],
      message: json['message'],
    );
  }

  static Map<String, dynamic> toJson(FavoriteEntity favoriteEntity) {
    return {
      "user_id":favoriteEntity.userId,
      "page": favoriteEntity.page,
    };
  }
}
