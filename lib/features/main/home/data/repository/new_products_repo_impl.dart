import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';



import '../../../../../core/resources/api/data_sources.dart';
import '../../../../../core/resources/api/error_handler.dart';
import '../../../../../core/resources/api/failure_class.dart';
import '../../../../../core/shared/entities/product_entity.dart';
import '../../domain/repository/new_products_repo.dart';
import '../data_sources/new_products_service.dart';

class NewProductsRepoImpl implements NewProductsRepo {
  final NewProductsService productsService;

  NewProductsRepoImpl({required this.productsService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getNewProducts(int nextPage) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getNewProducts = await productsService.getNewProducts(nextPage);
        return right(getNewProducts);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

}