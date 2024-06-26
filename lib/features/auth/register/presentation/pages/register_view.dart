import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/shared/arguments.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:loveleta/features/auth/register/domain/entities/register_entity.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../core/router/router.dart';
import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';
import '../manager/register_cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isPass = true;
  bool isPassConf = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          state.maybeWhen(
            success: (state) {
              if (state.status == 1) {
                context.defaultSnackBar(
                  S.of(context).emailRegisteredSuccessful(state.email!),
                  color: AppColors.successColor,
                  textColor: AppColors.textBlack,
                );
                context.pushNamed(
                  verifyAccountPageRoute,
                  arguments: ChangePassArgs(
                    email: state.email!,
                  ),
                );
              }
            },
            error: (errCode, err) {
              if (int.parse(errCode) == 400) {
                context.defaultSnackBar(
                    S.of(context).emailAlreadyExist,
                    color: AppColors.errorColor);
              } else {
                context.defaultSnackBar(
                  S.of(context).error(errCode, err),
                  color: AppColors.errorColor,
                );
              }
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          RegisterCubit registerCubit = RegisterCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.p25),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(60.h),
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppImages.appLogoSvg,
                          height: 100.h,
                          width: 85.w,
                        ),
                      ),
                      Gap(20.h),
                      Text(
                        S.of(context).signUp,
                        style: CustomTextStyle.kTextStyleF26.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gap(30.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomFormField(
                              stream: registerCubit.firstNameStream,
                              onChanged: (firstName) {
                                registerCubit.validateFirstName(firstName);
                              },
                              label: S.of(context).firstName,
                              nextAction: TextInputAction.next,
                            ),
                          ),
                          Gap(10.w),
                          Expanded(
                            child: CustomFormField(
                              stream: registerCubit.lastNameStream,
                              onChanged: (lastName) {
                                registerCubit.validateLastName(lastName);
                              },
                              label: S.of(context).lastName,
                              nextAction: TextInputAction.next,
                            ),
                          ),
                        ],
                      ),
                      Gap(10.h),
                      CustomFormField(
                        stream: registerCubit.emailStream,
                        onChanged: (email) {
                          registerCubit.validateEmail(email);
                        },
                        label: S.of(context).email,
                        nextAction: TextInputAction.next,
                      ),
                      Gap(10.h),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: CountryCodePicker(
                              initialSelection: 'SA',
                              favorite: const ['966', 'SA'],
                              onChanged: (code) {
                                registerCubit.countryCode = code.dialCode!;
                              },
                              onInit: (code) {
                                registerCubit.countryCode = code!.dialCode!;
                              },

                            ),
                          ),
                          Gap(10.w),
                          Flexible(
                            flex: 2,
                            child: CustomFormField(
                              stream: registerCubit.phoneStream,
                              onChanged: (phone) {
                                registerCubit.validatePhone(phone);
                              },
                              label: S.of(context).phoneNumber,
                              nextAction: TextInputAction.next,
                            ),
                          ),
                        ],
                      ),
                      Gap(10.h),
                      CustomFormField(
                        stream: registerCubit.passStream,
                        onChanged: (pass) {
                          registerCubit.validatePass(pass);
                        },
                        label: S.of(context).password,
                        nextAction: TextInputAction.next,
                        isPassword: isPass,
                        postIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPass = !isPass;
                            });
                          },
                          child: isPass
                              ? Icon(MdiIcons.eye)
                              : Icon(MdiIcons.eyeOff),
                        ),
                      ),
                      Gap(10.h),
                      CustomFormField(
                        stream: registerCubit.passConfStream,
                        onChanged: (passConfirm) {
                          registerCubit.validatePassConfirm(passConfirm);
                        },
                        label: S.of(context).passwordConfirmation,
                        nextAction: TextInputAction.done,
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
                      Gap(20.h),
                      StreamBuilder(
                        stream: registerCubit.registerBtnStream,
                        builder: (context, snapshot) {
                          return ConditionalBuilder(
                            condition: state is! Loading,
                            builder: (ctx) {
                              return CustomBtn(
                                isUpperCase: false,
                                label: S.of(context).signUp,
                                onPressed: snapshot.hasError
                                    ? null
                                    : () {
                                        registerCubit.userRegister(
                                          RegisterEntity(
                                            firstName: registerCubit
                                                .firstNameCtrl.value,
                                            lastName: registerCubit
                                                .lastNameCtrl.value,
                                            email:
                                                registerCubit.emailCtrl.value,
                                            phone:
                                                "${registerCubit.countryCode}${registerCubit.phoneCtrl.value}",
                                            pass: registerCubit.passCtrl.value,
                                            passConf: registerCubit
                                                .passConfCtrl.value,
                                          ),
                                        );
                                      },
                              );
                            },
                            fallback: (ctx) {
                              return Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(
                                      color: AppColors.pinkPrimary,
                                    ),
                                  ),
                                  Gap(5.h),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      Gap(30.h),
                      Row(
                        children: [
                          Text(
                            S.of(context).alreadyHaveAnAccount,
                            style: CustomTextStyle.kTextStyleF16,
                          ),
                          TextButton(
                            onPressed: () {
                              context.pushNamed(loginPageRoute);
                            },
                            child: Text(
                              S.of(context).login,
                              style: CustomTextStyle.kTextStyleF16.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
