
import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/order_entity.dart';

abstract class UserOrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> myOrders(OrderEntity myOrdersEntity);
}