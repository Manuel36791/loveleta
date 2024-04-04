import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/favorite_entity.dart';


abstract class FavoriteRepo {
  Future<Either<Failure, FavoriteEntity>> getFavorites(FavoriteEntity favoriteEntity);

}
