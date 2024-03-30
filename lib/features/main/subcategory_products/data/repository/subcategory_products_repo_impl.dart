import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/resources/api/data_sources.dart';
import '../../../../../core/resources/api/error_handler.dart';
import '../../../../../core/resources/api/failure_class.dart';
import '../../../../../core/shared/entities/product_entity.dart';
import '../../domain/entities/subcategory_products_entity.dart';
import '../../domain/repository/subcategory_products_repo.dart';
import '../data_sources/subcategory_products_service.dart';

class SubCategoryProductsRepoImpl implements SubCategoryProductsRepo {
  final SubCategoryProductsService categoryService;

  SubCategoryProductsRepoImpl({required this.categoryService});

  @override
  Future<Either<Failure, SubCategoryProductsEntity>> getSubCategoryProducts(SubCategoryProductsEntity subcategoryProductsEntity) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getCategories = await categoryService.getSubCategoryProducts(subcategoryProductsEntity);
        return right(getCategories);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}