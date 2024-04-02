import 'package:equatable/equatable.dart';

import '../../../../../core/database/address_class.dart';
import '../../../../../core/shared/entities/product_entity.dart';

class OrderEntity extends Equatable {
  final num? id;
  final String? orderNo;
  final num? userId;
  final num? shippingAddressId;
  final num? status;
  final num? subTotalPrice;
  final num? totalPrice;
  final num? totalDiscount;
  final num? shippingCost;
  final num? tax;
  final num? discount;
  final String? shippingMethod;
  final String? paymentMethod;
  final String? updatedAt;
  final List<ProductEntity>? products;
  final Address? shippingAddress;

  const OrderEntity({
    this.id,
    this.orderNo,
    this.userId,
    this.shippingAddressId,
    this.status,
    this.subTotalPrice,
    this.totalPrice,
    this.totalDiscount,
    this.shippingCost,
    this.tax,
    this.discount,
    this.shippingMethod,
    this.paymentMethod,
    this.updatedAt,
    this.products,
    this.shippingAddress,
  });

  @override
  List<Object?> get props => [
        id,
        orderNo,
        userId,
        shippingAddressId,
        status,
        subTotalPrice,
        totalPrice,
        totalDiscount,
        shippingCost,
        tax,
        discount,
        shippingMethod,
        paymentMethod,
        updatedAt,
        products,
        shippingAddress,
      ];
}
