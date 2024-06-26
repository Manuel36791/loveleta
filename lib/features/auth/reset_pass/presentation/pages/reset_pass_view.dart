import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:loveleta/features/auth/reset_pass/domain/entities/resend_code_entity.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../core/router/router.dart';
import '../../../../../core/shared/arguments.dart';
import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';
import '../../domain/entities/reset_entity.dart';
import '../manager/reset_pass_cubit.dart';

class ResetPassView extends StatefulWidget {
  final String email;

  const ResetPassView({super.key, required this.email});

  @override
  State<ResetPassView> createState() => _ResetPassViewState();
}

class _ResetPassViewState extends State<ResetPassView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<ResetPassCubit>(),
      child: BlocConsumer<ResetPassCubit, ResetPassStates>(
        listener: (context, state) {
          state.maybeWhen(
            success: (state) {
              if (state.status == "0") {
                context.defaultSnackBar(
                  S.of(context).wrongOtpEntered,
                  color: AppColors.errorColor,
                );
              } else {
                context.pushNamed(
                  changePassPageRoute,
                  arguments: ChangePassArgs(
                    email: widget.email,
                  ),
                );
              }
            },
            error: (errCode, err) {
              context.defaultSnackBar(
                S.of(context).error(errCode, err),
                color: AppColors.errorColor,
              );
            },
            resendCode: (state) {
              if (state.status == 1) {
                context.defaultSnackBar(
                  S.of(context).newOtpSent,
                  color: AppColors.warningColor,
                  textColor: AppColors.textBlack,
                );
              } else {
                context.defaultSnackBar(
                  S.of(context).invalidEmailAddress,
                  color: AppColors.errorColor,
                );
              }
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          ResetPassCubit resetPassCubit = ResetPassCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.p25),
                child: SingleChildScrollView(
                  child: Column(
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
                        S.of(context).resetPassword,
                        style: CustomTextStyle.kTextStyleF26.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gap(30.h),
                      StreamBuilder(
                        stream: resetPassCubit.pinStream,
                        builder: (context, snapshot) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Dimensions.p30.h),
                                child: Pinput(
                                  onChanged: (code) {
                                    resetPassCubit.validateCode(code);
                                  },
                                  closeKeyboardWhenCompleted: false,
                                  length: 6,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  focusNode: FocusNode(),
                                  showCursor: true,
                                  defaultPinTheme: PinTheme(
                                    height: 45.h,
                                    width: 66.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        Dimensions.r5,
                                      ),
                                    ),
                                    textStyle: CustomTextStyle.kPinTextStyle,
                                  ),
                                ),
                              ),
                              snapshot.hasError
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        snapshot.error.toString(),
                                        style: const TextStyle(
                                          color: AppColors.errorColor,
                                        ),
                                      ),
                                    )
                                  : Gap(5.h),
                            ],
                          );
                        },
                      ),
                      Gap(20.h),
                      Row(
                        children: [
                          Expanded(
                            child: StreamBuilder(
                                stream: resetPassCubit.verifyBtnStream,
                                builder: (context, snapshot) {
                                  return ConditionalBuilder(
                                    condition: state is! Loading,
                                    builder: (ctx) {
                                      return CustomBtn(
                                        label: S.of(context).resetPasswordBtn,
                                        onPressed: snapshot.hasError
                                            ? null
                                            : () {
                                                resetPassCubit.resetUserPassword(
                                                  ResetPassEntity(
                                                    email: widget.email,
                                                    otp: resetPassCubit
                                                        .pinCtrl.value,
                                                  ),
                                                );
                                              },
                                      );
                                    },
                                    fallback: (ctx) {
                                      return const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.pinkPrimary,
                                        ),
                                      );
                                    },
                                  );
                                }),
                          ),
                          Gap(10.w),
                          Expanded(
                            child: ConditionalBuilder(
                              condition: state is! Loading,
                              builder: (ctx) {
                                return CustomBtn(
                                  label: S.of(context).sendAgain,
                                  onPressed: () {
                                    resetPassCubit.resendCode(
                                      ResetResendCodeEntity(
                                        email: widget.email,
                                      )
                                    );
                                  },
                                  bgColor: Colors.white,
                                  textStyle:
                                      CustomTextStyle.kBtnTextStyle.copyWith(
                                    color: AppColors.textBlack,
                                  ),
                                );
                              },
                              fallback: (ctx) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.pinkPrimary,
                                  ),
                                );
                              },
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
