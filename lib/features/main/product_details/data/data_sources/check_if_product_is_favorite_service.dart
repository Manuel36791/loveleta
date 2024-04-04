import 'package:dio/dio.dart';

import '../../../../../core/service/dio_factory.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/favorite_product_entity.dart';
import '../models/favorite_product_model.dart';

abstract class CheckIfProductIsFavoriteService {
  Future<FavoriteProductModel> checkIfProductIsFavorite(FavoriteProductEntity favoriteProductEntity);
}

class CheckIfProductIsFavoriteServiceImpl implements CheckIfProductIsFavoriteService {
  @override
  Future<FavoriteProductModel> checkIfProductIsFavorite(FavoriteProductEntity favoriteProductEntity) async {
    Dio dio = await DioFactory.getDio();
    FavoriteProductModel favoriteProductModel = const FavoriteProductModel();

    final addFavorite = await dio.post(
      AppConstants.checkIfFavoriteUri,
      data: FavoriteProductModel.toJson(favoriteProductEntity),
    );

    if (addFavorite.statusCode == 200) {
      favoriteProductModel = FavoriteProductModel.checkFromJson(addFavorite.data);
    }

    return favoriteProductModel;
  }
}