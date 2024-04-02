import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/user_orders_repo.dart';
import '../data_sources/user_orders_service.dart';

class UserOrdersRepoImpl implements UserOrdersRepo {
  final UserOrdersService userOrdersService;

  UserOrdersRepoImpl({required this.userOrdersService});

  @override
  Future<Either<Failure, List<OrderEntity>>> myOrders(OrderEntity myOrdersEntity) async {
    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final orders = await userOrdersService.getOrders(myOrdersEntity);
        return right(orders);
      } on DioException catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.noInternetConnection.getFailure());
    }
  }
}