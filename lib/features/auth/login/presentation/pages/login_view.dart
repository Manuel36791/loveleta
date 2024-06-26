import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/helpers/cache_helper.dart';
import 'package:loveleta/core/router/router.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../core/shared/models/user_data_model.dart';
import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';
import '../../domain/entities/login_entity.dart';
import '../manager/login_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPass = true;
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          state.maybeWhen(
            success: (state) async {
              if (state.status == 1) {
                context.defaultSnackBar(
                    S.of(context).loggedInSuccessful(UserData.firstName!),
                    color: AppColors.successColor,
                    textColor: AppColors.textBlack);
                context.pushNamed(bottomNavBar);
              } else if (state.status == 0 &&
                  state.msg ==
                      "Active your account first verification code sent to your email !") {
                // await resendCodeUseCase(email.ifEmpty());
                // loginCubit.resendCode(loginCubit.emailCtrl.text);
                // context.pushNamed(
                //   verifyAccountPageRoute,
                //   arguments:
                //   VerifyAccountArgs(email: loginCubit.emailCtrl.text),
                // );
                context.defaultSnackBar(S.of(context).accountNotActivated,
                    color: AppColors.warningColor,
                    textColor: AppColors.textBlack);
              } else {
                context.defaultSnackBar(
                  S.of(context).invalidCredentials,
                  color: AppColors.errorColor,
                );
              }
            },
            error: (errCode, err) {
              context.defaultSnackBar(
                S.of(context).error(errCode, err),
                color: AppColors.errorColor,
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          LoginCubit loginCubit = LoginCubit.get(context);
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
                        S.of(context).login,
                        style: CustomTextStyle.kTextStyleF26.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gap(30.h),
                      CustomFormField(
                        stream: loginCubit.emailStream,
                        onChanged: (email) {
                          loginCubit.validateEmail(email);
                        },
                        label: S.of(context).email,
                        nextAction: TextInputAction.next,
                      ),
                      Gap(10.h),
                      CustomFormField(
                        stream: loginCubit.passStream,
                        onChanged: (pass) {
                          loginCubit.validatePass(pass);
                        },
                        label: S.of(context).password,
                        nextAction: TextInputAction.done,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                activeColor: AppColors.pinkPrimary,
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value!;
                                  });

                                  if (rememberMe == true) {
                                    CacheHelper.setData("email", loginCubit.emailCtrl.value);
                                    CacheHelper.setData("pass", loginCubit.passCtrl.value);
                                  }
                                },
                              ),
                              Text(
                                S.of(context).rememberMe,
                                style: CustomTextStyle.kTextStyleF13,
                              ),
                            ],
                          ),
                          TextButton(
                            child: Text(
                              S.of(context).forgotPassword,
                              style: CustomTextStyle.kTextStyleF13,
                            ),
                            onPressed: () {
                              context.pushNamed(forgotPassPageRoute);
                            },
                          ),
                        ],
                      ),
                      Gap(30.h),
                      StreamBuilder(
                        stream: loginCubit.loginStream,
                        builder: (context, snapshot) {
                          return ConditionalBuilder(
                            condition: state is! Loading,
                            builder: (ctx) {
                              return CustomBtn(
                                isUpperCase: false,
                                label: S.of(context).login,
                                onPressed: snapshot.hasError
                                    ? null
                                    : () {
                                        loginCubit.userLogin(
                                          LoginEntity(
                                            email: loginCubit.emailCtrl.value,
                                            pass: loginCubit.passCtrl.value,
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
                      Gap(20.h),
                      Row(
                        children: [
                          Text(
                            S.of(context).dontHaveAnAccount,
                            style: CustomTextStyle.kTextStyleF16,
                          ),
                          TextButton(
                            onPressed: () {
                              context.pushNamed(registerPageRoute);
                            },
                            child: Text(
                              S.of(context).signUp,
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
