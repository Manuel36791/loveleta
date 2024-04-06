import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/shared/models/product_model.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/search_entity.dart';
import '../models/search_model.dart';

abstract class SearchService {
  Future<List<ProductModel>> searchProducts(SearchEntity search);
}

class SearchServiceImpl implements SearchService {
  @override
  Future<List<ProductModel>> searchProducts(SearchEntity search) async {
    Dio dio = await DioFactory.getDio();
    List<ProductModel> productsList = [];

    final contracts = await dio.get(
        AppConstants.searchUri,
        queryParameters: SearchModel.toJson(search),
    );

    if (contracts.statusCode == 200) {
      Iterable l = contracts.data['data']['data'];
      productsList = List<ProductModel>.from(
        l.map(
              (model) => ProductModel.fromJson(model),
        ),
      );
    }

    return productsList;
  }
  
}