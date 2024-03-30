import 'package:dio/dio.dart';

import '../../../../../core/service/dio_factory.dart';
import '../../../../../core/shared/models/product_model.dart';
import '../../../../../core/utils/app_constants.dart';

abstract class NewProductsService {
  Future<List<ProductModel>> getNewProducts(int nextPage);
}

class NewProductsServiceImpl implements NewProductsService {
  @override
  Future<List<ProductModel>> getNewProducts(int nextPage) async {
    Dio dio = await DioFactory.getDio();
    List<ProductModel> productsList = [];

    final categories = await dio.get(
      AppConstants.getNewProductsUri,
      queryParameters: {
        'page': nextPage,
      }
    );

    if (categories.statusCode == 200) {
      Map<String, dynamic> responseData = categories.data; // Assuming response.data is a Map<String, dynamic>
      List<dynamic> data = responseData['data']['data']; // Extract the list from the map using the key 'categories'
      productsList = data.map((item) => ProductModel.fromJson(item)).toList();
    }

    return productsList;
  }
}