import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/shared/arguments.dart';
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
import '../../domain/entities/forget_pass_entity.dart';
import '../manager/forgot_pass_cubit.dart';

class ForgotPassView extends StatefulWidget {
  const ForgotPassView({super.key});

  @override
  State<ForgotPassView> createState() => _ForgotPassViewState();
}

class _ForgotPassViewState extends State<ForgotPassView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<ForgotPassCubit>(),
      child: BlocConsumer<ForgotPassCubit, ForgotPassStates>(
        listener: (context, state) {
          ForgotPassCubit forgotPassCubit = ForgotPassCubit.get(context);

          state.maybeWhen(
            success: (state) {
              if (state.status == 1) {
                context.pushNamed(
                  resetPassPageRoute,
                  arguments: ResetPassArgs(
                    email: forgotPassCubit.emailCtrl.value,
                  ),
                );
              } else {
                context.defaultSnackBar(
                  S.of(context).emailNotRegistered,
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
          ForgotPassCubit forgotPassCubit = ForgotPassCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.p25),
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
                      S.of(context).forgotPassword,
                      style: CustomTextStyle.kTextStyleF26.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gap(30.h),
                    CustomFormField(
                      stream: forgotPassCubit.emailStream,
                      onChanged: (email) {
                        forgotPassCubit.validateEmail(email);
                      },
                      label: S.of(context).email,
                      nextAction: TextInputAction.next,
                    ),
                    Gap(30.h),
                    ConditionalBuilder(
                      condition: state is! Loading,
                      builder: (context) => CustomBtn(
                        label: S.of(context).submit,
                        onPressed: () {
                          forgotPassCubit.userForgotPass(
                            ForgetPassEntity(
                              email: forgotPassCubit.emailCtrl.value,
                            ),
                          );
                        },
                      ),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.pinkPrimary,
                        ),
                      ),
                    ),
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
