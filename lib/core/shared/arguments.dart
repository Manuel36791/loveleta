import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressArgs {
  final Placemark address;
  final LatLng latLng;

  AddressArgs({required this.latLng, required this.address});
}

class VerifyAccountArgs {
  final String email;

  VerifyAccountArgs({required this.email});
}