import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/favorite_entity.dart';
import '../../domain/repositories/favorite_repo.dart';
import '../data_sources/favorite_service.dart';


class FavoriteRepoImpl implements FavoriteRepo {
  final FavoriteService favoriteService;

  FavoriteRepoImpl({required this.favoriteService});


  @override
  Future<Either<Failure, FavoriteEntity>> getFavorites(FavoriteEntity favoriteEntity) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getContracts = await favoriteService.getFavorites(favoriteEntity);
        return right(getContracts);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}