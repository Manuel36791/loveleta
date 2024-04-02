import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/cancel_order_entity.dart';
import '../../domain/use_cases/cancel_order_usecase.dart';

part 'cancel_order_states.dart';
part 'cancel_order_cubit.freezed.dart';

class CancelOrderCubit extends Cubit<CancelOrderStates> {
  CancelOrderCubit({required this.cancelOrderUseCase}) : super(const CancelOrderStates.initial());

  static CancelOrderCubit get(context) => BlocProvider.of(context);

  final CancelOrderUseCase cancelOrderUseCase;

  cancelOrder(CancelOrderEntity cancelOrderEntity) async {
    emit(const CancelOrderStates.loading());
    final order = await cancelOrderUseCase(cancelOrderEntity);

    order.fold(
          (l) {
        emit(
          CancelOrderStates.error(
            l.code.toString(),
            l.message,
          ),
        );
      },
          (r) async {
        emit(
          CancelOrderStates.cancelSuccess(r),
        );

      },
    );
  }
}
