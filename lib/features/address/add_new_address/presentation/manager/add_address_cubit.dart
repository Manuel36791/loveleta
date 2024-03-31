import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../core/database/address_class.dart';
import '../../../../../../core/database/database_hive.dart';

part 'add_address_state.dart';

part 'add_address_cubit.freezed.dart';

class AddAddressCubit extends Cubit<AddAddressStates> {
  AddAddressCubit({required this.hiveDatabase})
      : super(const AddAddressStates.initial());

  static AddAddressCubit get(BuildContext context) => BlocProvider.of(context);

  final HiveDatabase hiveDatabase;

  addAddress(Address address) async {
    emit(
      const AddAddressStates.loading(),
    );

    try {
      await hiveDatabase.addAddress(address);
      const AddAddressStates.success();
    } catch (err) {
      emit(
        AddAddressStates.error(
          err.toString(),
        ),
      );
    }
  }

  var addressCtrl = BehaviorSubject<String>();
  var buildingNoCtrl = BehaviorSubject<String>();
  var flatNoCtrl = BehaviorSubject<String>();
  var stateCtrl = BehaviorSubject<String>();
  var cityCtrl = BehaviorSubject<String>();
  var zipCodeCtrl = BehaviorSubject<String>();

  Stream<String> get addressStream => addressCtrl.stream;
  Stream<String> get buildingNoStream => addressCtrl.stream;
  Stream<String> get flatNoStream => addressCtrl.stream;
  Stream<String> get stateStream => addressCtrl.stream;
  Stream<String> get cityStream => addressCtrl.stream;
  Stream<String> get zipCodeStream => addressCtrl.stream;

  updateAddress(Placemark address) {
    addressCtrl.sink.add(address.street!);
    stateCtrl.sink.add(address.administrativeArea!);
    cityCtrl.sink.add(address.subAdministrativeArea!);
    zipCodeCtrl.sink.add(address.postalCode!);
  }

  updateBuildingNo(String buildingNo) => buildingNoCtrl.sink.add(buildingNo);

  updateFlatNo(String flatNo) => flatNoCtrl.sink.add(flatNo);
}
