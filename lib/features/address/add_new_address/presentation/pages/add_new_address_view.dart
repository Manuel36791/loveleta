
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

  // TextEditingController addressCtrl = TextEditingController();
  // TextEditingController buildingCtrl = TextEditingController();
  // TextEditingController flatCtrl = TextEditingController();
  // TextEditingController phoneCtrl = TextEditingController();
  // TextEditingController stateCtrl = TextEditingController();
  // TextEditingController cityCtrl = TextEditingController();
  // TextEditingController zipCodeCtrl = TextEditingController();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   addressCtrl = TextEditingController(text: widget.address.street);
  //   stateCtrl = TextEditingController(text: widget.address.administrativeArea);
  //   cityCtrl =
  //       TextEditingController(text: widget.address.subAdministrativeArea);
  //   zipCodeCtrl = TextEditingController(text: widget.address.postalCode);
  // }

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
              title: const Text(
               "Add new address",
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
                                label: "Address",
                                readOnly: true,
                                stream: addAddressCubit.addressStream,
                                initValue: addAddressCubit.addressCtrl.value,
                                onChanged: (value) {},
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: "Building No.",
                                stream: addAddressCubit.buildingNoStream,
                                onChanged: (buildingNo) {
                                  addAddressCubit.updateBuildingNo(buildingNo);
                                },
                                // validator: (value) {
                                //   if (buildingCtrl.text.isEmpty) {
                                //     log(value.toString());
                                //     return S.of(context).buildingNoCantBeEmpty;
                                //   } else {
                                //     return null;
                                //   }
                                // },
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: "Flat No.",
                                stream: const Stream.empty(),
                                onChanged: (flatNo) {
                                  addAddressCubit.updateFlatNo(flatNo);
                                },
                                // validator: (value) {
                                //   if (flatCtrl.text.isEmpty) {
                                //     log(value.toString());
                                //     return S.of(context).flatNoCantBeEmpty;
                                //   } else {
                                //     return null;
                                //   }
                                // },
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: "State",
                                readOnly: true,
                                stream: addAddressCubit.stateStream,
                                initValue: addAddressCubit.stateCtrl.value,
                                onChanged: (value) {},
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: "City",
                                readOnly: true,
                                stream: addAddressCubit.cityStream,
                                initValue: addAddressCubit.cityCtrl.value,
                                onChanged: (value) {
                                },
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: "Zip Code",
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
                              label: "Add Address",
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
                                label: "Address",
                                readOnly: true,
                                stream: addAddressCubit.addressStream,
                                initValue: addAddressCubit.addressCtrl.value,
                                onChanged: (value) {},
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: "Building No.",
                                stream: addAddressCubit.buildingNoStream,
                                onChanged: (buildingNo) {
                                  addAddressCubit.updateBuildingNo(buildingNo);
                                },
                                // validator: (value) {
                                //   if (buildingCtrl.text.isEmpty) {
                                //     log(value.toString());
                                //     return S.of(context).buildingNoCantBeEmpty;
                                //   } else {
                                //     return null;
                                //   }
                                // },
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: "Flat No.",
                                stream: const Stream.empty(),
                                onChanged: (flatNo) {
                                  addAddressCubit.updateFlatNo(flatNo);
                                },
                                // validator: (value) {
                                //   if (flatCtrl.text.isEmpty) {
                                //     log(value.toString());
                                //     return S.of(context).flatNoCantBeEmpty;
                                //   } else {
                                //     return null;
                                //   }
                                // },
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: "State",
                                readOnly: true,
                                stream: addAddressCubit.stateStream,
                                initValue: addAddressCubit.stateCtrl.value,
                                onChanged: (value) {},
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: "City",
                                readOnly: true,
                                stream: addAddressCubit.cityStream,
                                initValue: addAddressCubit.cityCtrl.value,
                                onChanged: (value) {
                                },
                              ),
                              Gap(10.h),
                              CustomFormField(
                                label: "Zip Code",
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
                              label: "Add Address",
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
