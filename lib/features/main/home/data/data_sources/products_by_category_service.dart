import 'package:dio/dio.dart';

import '../../../../../core/service/dio_factory.dart';
import '../../../../../core/shared/models/product_model.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../categories/domain/entities/category_entity.dart';

abstract class ProductsByCategoryService {
  Future<List<ProductModel>> getProducts(CategoryEntity categoryEntity);
}

class ProductsByCategoryServiceImpl implements ProductsByCategoryService {
  @override
  Future<List<ProductModel>> getProducts(CategoryEntity categoryEntity) async {
    Dio dio = await DioFactory.getDio();
    List<ProductModel> productsList = [];

    final categories = await dio.get(
      AppConstants.getProductsByCatUri,
      queryParameters: CategoryModel.toJson(categoryEntity),

    );

    if (categories.statusCode == 200) {
      Map<String, dynamic> responseData = categories.data; // Assuming response.data is a Map<String, dynamic>
      List<dynamic> data = responseData['products']['data']; // Extract the list from the map using the key 'categories'
      productsList = data.map((item) => ProductModel.fromJson(item)).toList();
    }

    return productsList;
  }

}