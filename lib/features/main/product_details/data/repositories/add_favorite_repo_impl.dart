import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loveleta/features/main/product_details/domain/entities/favorite_product_entity.dart';

import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/repository/favorite_product_repo.dart';
import '../data_sources/add_product_to_favorites_service.dart';
import '../data_sources/check_if_product_is_favorite_service.dart';

class FavoriteProductRepoImpl implements FavoriteProductRepo {
  final AddProductToFavoriteService addProductToFavoriteService;
  final CheckIfProductIsFavoriteService checkIfProductIsFavoriteService;

  FavoriteProductRepoImpl(
      {required this.addProductToFavoriteService,
      required this.checkIfProductIsFavoriteService});

  @override
  Future<Either<Failure, FavoriteProductEntity>> addProductToFavorites(
      FavoriteProductEntity favoriteProductEntity) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final addToFavorites =
            await addProductToFavoriteService.addProductToFavorite(favoriteProductEntity);
        return right(addToFavorites);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, FavoriteProductEntity>> checkIfProductIsFavorite(
      FavoriteProductEntity favoriteProductEntity) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final checkFavorites =
            await checkIfProductIsFavoriteService.checkIfProductIsFavorite(favoriteProductEntity);
        return right(checkFavorites);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
