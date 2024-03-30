import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';



import '../../../../../core/resources/api/data_sources.dart';
import '../../../../../core/resources/api/error_handler.dart';
import '../../../../../core/resources/api/failure_class.dart';
import '../../../../../core/shared/entities/product_entity.dart';
import '../../domain/repository/best_seller_repo.dart';
import '../data_sources/best_seller_service.dart';

class BestSellerRepoImpl implements BestSellerRepo {
  final BestSellerService productsService;

  BestSellerRepoImpl({required this.productsService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellers(int nextPage) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getBestSellers = await productsService.getBestSellerProducts(nextPage);
        return right(getBestSellers);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

}