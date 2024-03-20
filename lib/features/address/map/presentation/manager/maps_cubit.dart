import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

import '../../data/models/maps_model.dart';

part 'maps_state.dart';

part 'maps_cubit.freezed.dart';

class MapsCubit extends Cubit<MapsStates> {
  MapsCubit() : super(const MapsStates.initial());

  static MapsCubit get(BuildContext context) => BlocProvider.of(context);

  /// Map Controller
  final Completer<GoogleMapController> googleMapCtrl = Completer();
  loc.LocationData? locationData;

  mapController(GoogleMapController controller) async {
    googleMapCtrl.complete(controller);
    locationData = await location.getLocation();
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(locationData!.latitude!, locationData!.longitude!),
          zoom: 15,
        ),
      ),
    );
    emit(
      const MapsStates.mapController(),
    );
  }

  /// Add Marker
  List<Marker> markers = [];

  addMarker(List<MapsModel> mapsList) {
    for (int i = 0; i < mapsList.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId('${mapsList[i].id}'),
          position: LatLng(
            double.parse(mapsList[i].latitude!),
            double.parse(mapsList[i].longitude!),
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }
    emit(
      const MapsStates.newLocation(),
    );
  }

  /// Convert Marker to Address data
  Future<Placemark> convertLocation(LatLng currentPosition) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(
        currentPosition.latitude, currentPosition.longitude);
    Placemark place = placeMarks[0];
    return place;
  }

  /// Custom Marker
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;

  void setCustomMarker() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "AppImages.mapMarkerImg",
    ).then((icon) {
      sourceIcon = icon;
    });

    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(
          3,
          3,
        ),
      ),
      "AppImages.mapMarkerImg",
    ).then((icon) {
      destinationIcon = icon;
    });

    emit(
      const MapsStates.customMarker(),
    );
  }

  // Location location = Location();
  loc.Location location = loc.Location();
  bool serviceEnabled = true;




  /// Get Image
  Future getBytesFromAsset(String path, int height, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetHeight: height,
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(
      format: ui.ImageByteFormat.png,
    ))
        ?.buffer
        .asUint8List();
  }

  loc.PermissionStatus? permission;
  LatLng? currentLocation;

  getCurrentLocation() async {
    permission = await location.requestPermission();
    if (permission == loc.PermissionStatus.granted) {
      locationData = await location.getLocation();
      currentLocation = LatLng(
        locationData!.latitude!,
        locationData!.longitude!,
      );
      emit(
        const MapsStates.userNewLocation(),
      );
    }
  }
}
