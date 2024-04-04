import 'package:dartz/dartz.dart';
import 'package:loveleta/features/main/product_details/domain/entities/favorite_product_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';


abstract class FavoriteProductRepo {
  Future<Either<Failure, FavoriteProductEntity>> addProductToFavorites(FavoriteProductEntity favoriteProductEntity);
  Future<Either<Failure, FavoriteProductEntity>> checkIfProductIsFavorite(FavoriteProductEntity favoriteProductEntity);

}
