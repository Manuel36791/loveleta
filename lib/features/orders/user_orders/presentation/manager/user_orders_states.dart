part of 'user_orders_cubit.dart';

@freezed
class UserOrdersStates with _$UserOrdersStates {
  const factory UserOrdersStates.initial() = _Initial;
  const factory UserOrdersStates.loading() = Loading;
  const factory UserOrdersStates.success(final List<OrderEntity> myOrders) = Success;
  const factory UserOrdersStates.error(final String errCode, final String err) = Error;
}
