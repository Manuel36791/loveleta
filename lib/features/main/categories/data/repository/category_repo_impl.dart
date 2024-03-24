import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loveleta/core/resources/api/failure_class.dart';
import 'package:loveleta/features/main/categories/domain/entities/category_entity.dart';

import '../../../../../core/resources/api/data_sources.dart';
import '../../../../../core/resources/api/error_handler.dart';
import '../../domain/repository/category_repo.dart';
import '../data_sources/category_service.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CategoryService categoryService;

  CategoryRepoImpl({required this.categoryService});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getCategories = await categoryService.getCategories();
        return right(getCategories);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

}