import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/utils/extensions.dart';

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
  
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
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
                                registerCubit.countryCode = code.code!;
                              },
                            ),
                          ),
                          Gap(10.w),
                          Flexible(
                            flex: 3,
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
                      ),
                      Gap(10.h),
                      CustomFormField(
                        stream: registerCubit.passConfirmStream,
                        onChanged: (passConfirm) {
                          registerCubit.validatePassConfirm(passConfirm);
                        },
                        label: S.of(context).passwordConfirmation,
                        nextAction: TextInputAction.done,
                      ),
                      Gap(20.h),
                      StreamBuilder(
                        stream: registerCubit.registerBtnStream,
                        builder: (context, snapshot) {
                          return ConditionalBuilder(
                            condition: true,
                            builder: (ctx) {
                              return CustomBtn(
                                isUpperCase: false,
                                label: S.of(context).signUp,
                                onPressed: snapshot.hasError ? null : () {
                                  context.pushNamed(verifyAccountPageRoute);
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
