import 'package:dio/dio.dart';

import '../../../../../core/service/dio_factory.dart';
import '../../../../../core/utils/app_constants.dart';
import '../models/category_model.dart';

abstract class CategoryService {
  Future<List<CategoryModel>> getCategories();
}

class CategoryServiceImpl implements CategoryService {
  @override
  Future<List<CategoryModel>> getCategories() async {
    Dio dio = await DioFactory.getDio();
    List<CategoryModel> categoriesList = [];

    final categories = await dio.get(
      AppConstants.getCategoriesUri,
    );

    if (categories.statusCode == 200) {
      Map<String, dynamic> responseData = categories.data; // Assuming response.data is a Map<String, dynamic>
      List<dynamic> data = responseData['categories']; // Extract the list from the map using the key 'posts'
      categoriesList = data.map((item) => CategoryModel.fromJson(item)).toList();
    }

    return categoriesList;
  }
}
