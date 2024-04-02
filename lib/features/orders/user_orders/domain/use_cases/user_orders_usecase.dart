import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/order_entity.dart';
import '../repositories/user_orders_repo.dart';

class UserOrdersUseCase {
  final UserOrdersRepo userOrdersRepo;

  UserOrdersUseCase({required this.userOrdersRepo});

  Future<Either<Failure, List<OrderEntity>>> call(OrderEntity myOrdersEntity) async {
    return await userOrdersRepo.myOrders(myOrdersEntity);
  }
}
