import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';




import '../../../../../core/resources/api/data_sources.dart';
import '../../../../../core/resources/api/error_handler.dart';
import '../../../../../core/resources/api/failure_class.dart';
import '../../../../../core/shared/entities/product_entity.dart';
import '../../../categories/domain/entities/category_entity.dart';
import '../../domain/repository/products_by_category.dart';
import '../data_sources/products_by_category_service.dart';

class ProductsByCategoryRepoImpl implements ProductsByCategoryRepo {
  final ProductsByCategoryService productsService;

  ProductsByCategoryRepoImpl({required this.productsService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getCategoryProducts(CategoryEntity categoryEntity) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getProducts = await productsService.getProducts(categoryEntity);
        return right(getProducts);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

}