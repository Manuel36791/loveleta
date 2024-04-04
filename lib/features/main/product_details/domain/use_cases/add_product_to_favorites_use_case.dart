import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/favorite_product_entity.dart';
import '../repository/favorite_product_repo.dart';

class AddProductToFavoritesUseCase {
  final FavoriteProductRepo addFavoriteRepo;

  AddProductToFavoritesUseCase({required this.addFavoriteRepo});

  Future<Either<Failure, FavoriteProductEntity>> call(
      FavoriteProductEntity favoriteProductEntity) async {
    return await addFavoriteRepo.addProductToFavorites(favoriteProductEntity);
  }
}
