import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/router/router.dart';
import 'package:loveleta/core/utils/extensions.dart';

import '../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';
import '../manager/login_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
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
                      ),
                      Gap(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                activeColor: AppColors.pinkPrimary,
                                value: true,
                                onChanged: (value) {},
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
                            condition: true,
                            builder: (ctx) {
                              return CustomBtn(
                                isUpperCase: false,
                                label: S.of(context).login,
                                onPressed: snapshot.hasError ? null : () {},
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
