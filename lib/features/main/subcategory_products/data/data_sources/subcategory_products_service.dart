import 'package:dio/dio.dart';

import '../../../../../core/service/dio_factory.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/subcategory_products_entity.dart';
import '../models/subcategory_products_model.dart';

abstract class SubCategoryProductsService {
  Future<SubCategoryProductsModel> getSubCategoryProducts(
      SubCategoryProductsEntity subcategoryProductsEntity);
}

class SubCategoryProductsServiceImpl implements SubCategoryProductsService {
  @override
  Future<SubCategoryProductsModel> getSubCategoryProducts(
      SubCategoryProductsEntity categoryProductsEntity) async {
    Dio dio = await DioFactory.getDio();
    SubCategoryProductsModel productsList = const SubCategoryProductsModel();

    final categories = await dio.get(
      AppConstants.getProductsBySubCatUri,
      queryParameters: SubCategoryProductsModel.toJson(categoryProductsEntity),
    );

    if (categories.statusCode == 200) {
      productsList = SubCategoryProductsModel.fromJson(categories.data);
    }

    return productsList;
  }
}
