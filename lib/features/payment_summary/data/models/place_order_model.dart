import '../../domain/entities/place_order_entity.dart';

class PlaceOrderModel extends PlaceOrderEntity {
  const PlaceOrderModel({
    super.userId,
    super.address,
    super.buildingNo,
    super.flatNo,
    super.city,
    super.country,
    super.postCode,
    super.products,
    super.coupon,
    super.paymentUrl,
    super.status,
    super.msg,
  });

  factory PlaceOrderModel.fromJson(Map<String, dynamic> json) {
    return PlaceOrderModel(
      status: json['status'],
      msg: json['message'],
      // paymentUrl: json['payment_url'],
    );
  }

  static Map<String, dynamic> toJson(PlaceOrderEntity placeOrderEntity) {
    return {
      'user_id': placeOrderEntity.userId,
      'address': placeOrderEntity.address,
      'building_number': placeOrderEntity.buildingNo,
      'flot_number': placeOrderEntity.flatNo,
      'city': placeOrderEntity.city,
      'country': placeOrderEntity.country,
      'post_code': placeOrderEntity.postCode,
      'product': placeOrderEntity.products,
    };
  }

  static Map<String, dynamic> toJsonIncludingCoupon(
      PlaceOrderEntity placeOrderEntity) {
    return {
      'user_id': placeOrderEntity.userId,
      'address': placeOrderEntity.address,
      'building_number': placeOrderEntity.buildingNo,
      'flot_number': placeOrderEntity.flatNo,
      'city': placeOrderEntity.city,
      'state': placeOrderEntity.country,
      'post_code': placeOrderEntity.postCode,
      'productInfo': placeOrderEntity.products,
      'coupon': placeOrderEntity.coupon,
    };
  }
}
