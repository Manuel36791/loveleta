import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/router/router.dart';
import 'package:loveleta/core/shared/widgets/custom_button.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:loveleta/features/auth/verify_account/domain/entities/verify_account_entity.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';
import '../manager/verify_account_cubit.dart';

class VerifyAccountView extends StatefulWidget {
  final String email;

  const VerifyAccountView({super.key, required this.email});

  @override
  State<VerifyAccountView> createState() => _VerifyAccountViewState();
}

class _VerifyAccountViewState extends State<VerifyAccountView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<VerifyAccountCubit>(),
      child: BlocConsumer<VerifyAccountCubit, VerifyAccountStates>(
        listener: (context, state) {
          state.maybeWhen(
            success: (state) {
              if (state.status == 1) {
                context.defaultSnackBar(
                  S.of(context).activationSuccess,
                  color: AppColors.successColor,
                  textColor: AppColors.textBlack,
                );
                context.pushNamed(loginPageRoute);
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
          VerifyAccountCubit verifyAccountCubit =
              VerifyAccountCubit.get(context);
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
                        S.of(context).verifyAccount,
                        style: CustomTextStyle.kTextStyleF26.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gap(30.h),
                      StreamBuilder(
                        stream: verifyAccountCubit.pinStream,
                        builder: (context, snapshot) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Dimensions.p30.h),
                                child: Pinput(
                                  onChanged: (code) {
                                    verifyAccountCubit.validateCode(code);
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
                                stream: verifyAccountCubit.verifyBtnStream,
                                builder: (context, snapshot) {
                                  return ConditionalBuilder(
                                    condition: true,
                                    builder: (ctx) {
                                      return CustomBtn(
                                        label: S.of(context).verify,
                                        onPressed: snapshot.hasError
                                            ? null
                                            : () {
                                                verifyAccountCubit
                                                    .verifyUserAccount(
                                                  VerifyAccountEntity(
                                                    email: widget.email,
                                                    otp: verifyAccountCubit
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
                              condition: true,
                              builder: (ctx) {
                                return CustomBtn(
                                  label: S.of(context).sendAgain,
                                  onPressed: () {},
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
