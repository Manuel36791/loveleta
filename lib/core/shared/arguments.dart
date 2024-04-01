import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../database/address_class.dart';
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

class CategoryProductsArgs {
  final num id;

  CategoryProductsArgs({required this.id});
}

class SubCategoryArgs {
  final List<dynamic> subCategories;

  SubCategoryArgs({required this.subCategories});
}

class SeeMoreArgs {
  final num? id;

  SeeMoreArgs({required this.id});
}

class PaymentSummaryArgs {
  final Address address;

  PaymentSummaryArgs({required this.address});
}
