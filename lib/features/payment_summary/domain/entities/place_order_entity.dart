import 'package:equatable/equatable.dart';

class PlaceOrderEntity extends Equatable {
  final num? userId;
  final String? address;
  final String? buildingNo;
  final String? flatNo;
  final String? city;
  final String? country;
  final String? postCode;
  final dynamic products;
  final String? coupon;
  final String? paymentUrl;
  final num? status;
  final String? msg;

  const PlaceOrderEntity({
    this.userId,
    this.address,
    this.buildingNo,
    this.flatNo,
    this.city,
    this.country,
    this.postCode,
    this.products,
    this.coupon,
    this.paymentUrl,
    this.status,
    this.msg,
  });

  @override
  List<Object?> get props => [
        userId,
        address,
        buildingNo,
        flatNo,
        city,
        country,
        postCode,
    products,
        coupon,
        paymentUrl,
        status,
        msg,
      ];
}
