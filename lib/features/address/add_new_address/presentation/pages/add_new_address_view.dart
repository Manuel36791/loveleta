
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loveleta/core/utils/extensions.dart';

import '../../../../../../core/database/address_class.dart';
import '../../../../../../core/database/database_hive.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../core/router/router.dart';
import '../../../../../generated/l10n.dart';
import '../manager/add_address_cubit.dart';

class AddNewAddressView extends StatefulWidget {
  final Placemark address;
  final LatLng latLng;

  const AddNewAddressView({super.key, required this.address, required this.latLng});

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  final Address address = Address();
  final HiveDatabase hiveDatabase = HiveDatabase();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAddressCubit(hiveDatabase: hiveDatabase)..updateAddress(widget.address),
      child: BlocConsumer<AddAddressCubit, AddAddressStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AddAddressCubit addAddressCubit = AddAddressCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
               S.of(context).addNewAddress,
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.p16),
                child: state.when(
                  initial: () {
                    return Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Gap(20.h),
                              CustomFormField(
                                label: S.of(context).address,
                                readOnly: true,
                                stream: addAddressCubit.addressStream,
                                initValue: addAddressCubit.addressCtrl.value,
                                onChanged: (value) {},
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: S.of(context).buildingNo,
                                stream: addAddressCubit.buildingNoStream,
                                onChanged: (buildingNo) {
                                  addAddressCubit.updateBuildingNo(buildingNo);
                                },
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: S.of(context).flatNo,
                                stream: const Stream.empty(),
                                onChanged: (flatNo) {
                                  addAddressCubit.updateFlatNo(flatNo);
                                },
                                
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: S.of(context).country,
                                readOnly: true,
                                stream: addAddressCubit.stateStream,
                                initValue: addAddressCubit.stateCtrl.value,
                                onChanged: (value) {},
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: S.of(context).city,
                                readOnly: true,
                                stream: addAddressCubit.cityStream,
                                initValue: addAddressCubit.cityCtrl.value,
                                onChanged: (value) {
                                },
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: S.of(context).postalCode,
                                readOnly: true,
                                stream: addAddressCubit.zipCodeStream,
                                initValue: addAddressCubit.zipCodeCtrl.value,
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Colors.white,
                            child: CustomBtn(
                              label: S.of(context).addAddress,
                              onPressed: () async {
                                addAddressCubit.addAddress(
                                  Address(
                                    address: addAddressCubit.addressCtrl.value,
                                    building: addAddressCubit.buildingNoCtrl.value,
                                    flat: addAddressCubit.flatNoCtrl.value,
                                    code: addAddressCubit.zipCodeCtrl.value,
                                    country: addAddressCubit.stateCtrl.value,
                                    city: addAddressCubit.cityCtrl.value,
                                    latitude: widget.latLng.latitude,
                                    longitude:  widget.latLng.longitude,
                                  ),
                                );
                                context.pushNamed(
                                  savedAddressesPageRoute,
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  loading: () {
                    return const StateLoadingWidget();
                  },
                  success: () {
                    return Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Gap(20.h),
                              CustomFormField(
                                label: S.of(context).address,
                                readOnly: true,
                                stream: addAddressCubit.addressStream,
                                initValue: addAddressCubit.addressCtrl.value,
                                onChanged: (value) {},
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: S.of(context).buildingNo,
                                stream: addAddressCubit.buildingNoStream,
                                onChanged: (buildingNo) {
                                  addAddressCubit.updateBuildingNo(buildingNo);
                                },
                                
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: S.of(context).flatNo,
                                stream: const Stream.empty(),
                                onChanged: (flatNo) {
                                  addAddressCubit.updateFlatNo(flatNo);
                                },
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: S.of(context).country,
                                readOnly: true,
                                stream: addAddressCubit.stateStream,
                                initValue: addAddressCubit.stateCtrl.value,
                                onChanged: (value) {},
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: S.of(context).city,
                                readOnly: true,
                                stream: addAddressCubit.cityStream,
                                initValue: addAddressCubit.cityCtrl.value,
                                onChanged: (value) {
                                },
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: S.of(context).postalCode,
                                readOnly: true,
                                stream: addAddressCubit.zipCodeStream,
                                initValue: addAddressCubit.zipCodeCtrl.value,
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Colors.white,
                            child: CustomBtn(
                              label: S.of(context).addAddress,
                              onPressed: () async {
                                addAddressCubit.addAddress(
                                  Address(
                                    address: addAddressCubit.addressCtrl.value,
                                    building: addAddressCubit.buildingNoCtrl.value,
                                    flat: addAddressCubit.flatNoCtrl.value,
                                    code: addAddressCubit.zipCodeCtrl.value,
                                    country: addAddressCubit.stateCtrl.value,
                                    city: addAddressCubit.cityCtrl.value,
                                    latitude: widget.latLng.latitude,
                                    longitude:  widget.latLng.longitude,
                                  ),
                                );
                                context.pushNamed(
                                  savedAddressesPageRoute,
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  error: (err) {
                    return StateErrorWidget(
                      errCode: AppConstants.unknownNumValue.toString(),
                      err: err,
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
