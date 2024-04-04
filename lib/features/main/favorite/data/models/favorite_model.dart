import '../../../../../../core/shared/models/product_model.dart';
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
      products: List<ProductModel>.from(
          json['products'].map((x) => ProductModel.fromJson(x))),
      status: json['status'],
      message: json['message'],
    );
  }

  static FavoriteModel toJson(FavoriteEntity favoriteEntity) {
    return FavoriteModel(
      userId: favoriteEntity.userId,
      page: favoriteEntity.page,
    );
  }
}
