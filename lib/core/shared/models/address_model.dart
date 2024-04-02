import '../../database/address_class.dart';

class AddressModel extends Address {
  AddressModel({
    super.address,
    super.building,
    super.flat,
    super.country,
    super.city,
    super.code,
    super.latitude,
    super.longitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      address: json['address'],
      building: json['building_number'],
      flat: json['flot_number'],
      country: json['country'],
      city: json['city'],
      code: json['post_code'],
    );
  }
}
