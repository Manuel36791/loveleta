import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/favorite_entity.dart';
import '../repositories/favorite_repo.dart';


class FavoriteUseCase {
  final FavoriteRepo favoriteRepo;

  FavoriteUseCase({required this.favoriteRepo});

  Future<Either<Failure, FavoriteEntity>> call(FavoriteEntity favoriteEntity) async {
    return await favoriteRepo.getFavorites(favoriteEntity);
  }
}
