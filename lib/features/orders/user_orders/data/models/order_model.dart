
import '../../../../../core/shared/entities/product_entity.dart';
import '../../../../../core/shared/models/address_model.dart';
import '../../../../../core/shared/models/product_model.dart';
import '../../domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    super.id,
    super.orderNo,
    super.userId,
    super.shippingAddressId,
    super.status,
    super.subTotalPrice,
    super.totalPrice,
    super.totalDiscount,
    super.shippingCost,
    super.tax,
    super.discount,
    super.shippingMethod,
    super.paymentMethod,
    super.updatedAt,
    super.products,
    super.shippingAddress,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      orderNo: json['order_no'],
      userId: json['user_id'],
      shippingAddressId: json['shipping_address_id'],
      status: json['status'],
      subTotalPrice: json['sub_total_price'],
      totalPrice: json['total_price'],
      totalDiscount: json['total_discount'],
      shippingCost: json['shipping_cost'],
      tax: json['tax'],
      discount: json['discount'],
      shippingMethod: json['shipping_method'],
      paymentMethod: json['payment_method'],
      updatedAt: json['updated_at'],
      products: List<ProductEntity>.from(json['products'].map((x) => ProductModel.fromJson(x))),
      shippingAddress: AddressModel.fromJson(json['shipping_address']),
    );
  }

  static Map<String, dynamic> toJson(OrderEntity orderEntity) {
    return {
      'user_id': orderEntity.userId,
    };
  }
}