import 'package:dio/dio.dart';
import 'package:loveleta/features/main/favorite/domain/entities/favorite_entity.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../models/favorite_model.dart';

abstract class FavoriteService {
  Future<FavoriteModel> getFavorites(FavoriteEntity favoriteEntity);
}

class FavoriteServiceImpl implements FavoriteService {
  @override
  Future<FavoriteModel> getFavorites(FavoriteEntity favoriteEntity) async {
    Dio dio = await DioFactory.getDio();
    FavoriteModel favoriteModel = const FavoriteModel();

    final favorites = await dio.post(
      AppConstants.getFavoriteProductsUri,
      data: FavoriteModel.toJson(favoriteEntity),
    );

    if (favorites.statusCode == 200) {
      favoriteModel = FavoriteModel.fromJson(favorites.data['data']);
    }

    return favoriteModel;
  }
}
