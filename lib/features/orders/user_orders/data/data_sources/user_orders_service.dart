import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/order_entity.dart';
import '../models/order_model.dart';


abstract class UserOrdersService {
  Future<List<OrderModel>> getOrders(OrderEntity myOrdersEntity);
}

class UserOrdersServiceImpl implements UserOrdersService {
  @override
  Future<List<OrderModel>> getOrders(OrderEntity ordersEntity) async {
    Dio dio = await DioFactory.getDio();
    List<OrderModel> ordersList = [];

    final orders = await dio.post(
      AppConstants.getOrders,
      data: OrderModel.toJson(ordersEntity),
    );

    if (orders.statusCode == 200) {
      Iterable l = orders.data;
      ordersList = List<OrderModel>.from(
        l.map(
              (model) => OrderModel.fromJson(model),
        ),
      );
    }

    return ordersList;
  }
}
