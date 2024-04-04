import 'package:dartz/dartz.dart';
import 'package:loveleta/features/main/product_details/domain/repository/favorite_product_repo.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/favorite_product_entity.dart';

class CheckIfProductIsFavoriteUseCase {
  final  FavoriteProductRepo checkIfProductIsFavoriteRepo;

  CheckIfProductIsFavoriteUseCase({required this.checkIfProductIsFavoriteRepo});

  Future<Either<Failure, FavoriteProductEntity>> call(
      FavoriteProductEntity favoriteProductEntity) async {
    return await checkIfProductIsFavoriteRepo.checkIfProductIsFavorite(favoriteProductEntity);
  }
}
