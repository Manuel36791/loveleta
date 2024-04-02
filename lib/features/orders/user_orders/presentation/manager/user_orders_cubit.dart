import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/order_entity.dart';
import '../../domain/use_cases/user_orders_usecase.dart';


part 'user_orders_states.dart';

part 'user_orders_cubit.freezed.dart';

class UserOrdersCubit extends Cubit<UserOrdersStates> {
  UserOrdersCubit({required this.userOrdersUseCase})
      : super(const UserOrdersStates.initial());

  static UserOrdersCubit get(BuildContext context) => BlocProvider.of(context);

  final UserOrdersUseCase userOrdersUseCase;

  getMyOrders(OrderEntity myOrdersEntity) async {
    emit(const UserOrdersStates.loading());
    final login = await userOrdersUseCase(myOrdersEntity);

    login.fold(
      (l) {
        emit(
          UserOrdersStates.error(
            l.code.toString(),
            l.message,
          ),
        );
      },
      (r) async {
        emit(
          UserOrdersStates.success(r),
        );
      },
    );
  }
}
