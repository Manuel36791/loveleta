import 'package:equatable/equatable.dart';

class FavoriteProductEntity extends Equatable {
  final num? userId;
  final num? productId;
  final num? status;
  final String? msg;

  const FavoriteProductEntity({
    this.userId,
    this.productId,
    this.status,
    this.msg,
  });

  @override
  List<Object?> get props => [
    userId,
    productId,
    status,
    msg,
  ];


}
