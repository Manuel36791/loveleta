import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../domain/entities/update_profile_entity.dart';
import '../manager/edit_profile_cubit.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  bool isPass = true;
  bool isPassConf = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<EditProfileCubit>()..userData(),
      child: BlocConsumer<EditProfileCubit, EditProfileStates>(
        listener: (context, state) {
          state.maybeWhen(
            success: (state) {
              context.defaultSnackBar("Account updated successfully");
            },
            deleteSuccess: (state) {
              context.defaultSnackBar(
                  "Account deleted successfully, you will be logged out.");
              context.pushNamed(loginPageRoute);
            },
            orElse: () {
              return null;
            },
          );
        },
        builder: (context, state) {
          EditProfileCubit editProfileCubit = EditProfileCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(context: context),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomFormField(
                            label: S.of(context).firstName,
                            stream: editProfileCubit.firstNameStream,
                            initValue: editProfileCubit.firstNameCtrl.value,
                            onChanged: (newFirstName) {
                              editProfileCubit.firstNameCtrl.sink
                                  .add(newFirstName);
                            },
                          ),
                        ),
                        Gap(10.w),
                        Expanded(
                          child: CustomFormField(
                            label: S.of(context).lastName,
                            stream: editProfileCubit.lastNameStream,
                            initValue: editProfileCubit.lastNameCtrl.value,
                            onChanged: (newLastName) {
                              editProfileCubit.lastNameCtrl.sink
                                  .add(newLastName);
                            },
                          ),
                        ),
                      ],
                    ),
                    Gap(10.h),
                    CustomFormField(
                      label: S.of(context).phoneNumber,
                      stream: editProfileCubit.phoneStream,
                      initValue: editProfileCubit.phoneCtrl.value,
                      onChanged: (newPhone) {
                        editProfileCubit.phoneCtrl.sink.add(newPhone);
                      },
                    ),
                    Gap(10.h),
                    CustomFormField(
                      label: S.of(context).password,
                      stream: editProfileCubit.passStream,
                      initValue: editProfileCubit.passCtrl.value,
                      onChanged: (newPass) {
                        editProfileCubit.passCtrl.sink.add(newPass);
                      },
                      isPassword: isPass,
                      postIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPass = !isPass;
                          });
                        },
                        child:
                            isPass ? Icon(MdiIcons.eye) : Icon(MdiIcons.eyeOff),
                      ),
                    ),
                    Gap(10.h),
                    CustomFormField(
                      label: S.of(context).passwordConfirmation,
                      stream: editProfileCubit.passConfStream,
                      initValue: editProfileCubit.passConfCtrl.value,
                      onChanged: (newPassConf) {
                        editProfileCubit.passConfCtrl.sink.add(newPassConf);
                      },
                      isPassword: isPassConf,
                      postIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPassConf = !isPassConf;
                          });
                        },
                        child: isPassConf
                            ? Icon(MdiIcons.eye)
                            : Icon(MdiIcons.eyeOff),
                      ),
                    ),
                    Gap(10.h),
                    Row(
                      children: [
                        Icon(
                          Icons.delete_outlined,
                          color: Colors.red[300],
                          size: 24.sp,
                        ),
                        Gap(10.w),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text(
                                          "Are you sure you want to delete your account?"),
                                      actions: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomBtn(
                                                onPressed: () => context.pop(),
                                                label: "No",
                                              ),
                                            ),
                                            Gap(10.w),
                                            Expanded(
                                              child: CustomBtn(
                                                onPressed: () {
                                                  editProfileCubit
                                                      .deleteAccount(
                                                    UpdateProfileEntity(
                                                      userId: UserData.id,
                                                    ),
                                                  );
                                                  Navigator.pop(context);
                                                },
                                                label: "Yes",
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ));
                          },
                          child: Text(
                            "Delete Account",
                            style: CustomTextStyle.kTextStyleF14.copyWith(
                              color: AppColors.errorColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const Spacer(),
                    CustomBtn(
                      label: "Update",
                      onPressed: () {
                        editProfileCubit.editProfile(
                          UpdateProfileEntity(
                            userId: UserData.id,
                            firstName: editProfileCubit.firstNameCtrl.value,
                            lastName: editProfileCubit.lastNameCtrl.value,
                            phone: editProfileCubit.phoneCtrl.value,
                            pass: editProfileCubit.passCtrl.value,
                            passConf: editProfileCubit.passConfCtrl.value,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
