import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'entities/product_entity.dart';

class AddressArgs {
  final Placemark address;
  final LatLng latLng;

  AddressArgs({required this.latLng, required this.address});
}

class VerifyAccountArgs {
  final String email;

  VerifyAccountArgs({required this.email});
}

class ResetPassArgs {
  final String email;

  ResetPassArgs({required this.email});
}

class ChangePassArgs {
  final String email;

  ChangePassArgs({required this.email});
}

class ProductDetailsArgs {
  final ProductEntity product;

  ProductDetailsArgs({required this.product});
}