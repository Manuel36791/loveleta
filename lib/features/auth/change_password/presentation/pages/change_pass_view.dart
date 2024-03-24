import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:loveleta/features/auth/change_password/domain/entities/change_pass_entity.dart';

import '../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../core/router/router.dart';
import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';
import '../manager/change_pass_cubit.dart';

class ChangePassView extends StatefulWidget {
  final String email;

  const ChangePassView({super.key, required this.email});

  @override
  State<ChangePassView> createState() => _ChangePassViewState();
}

class _ChangePassViewState extends State<ChangePassView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<ChangePassCubit>(),
      child: BlocConsumer<ChangePassCubit, ChangePassStates>(
        listener: (context, state) {
          state.maybeWhen(
            success: (state) {
              if (state.status == 1) {
                context.defaultSnackBar(
                  S.of(context).passwordChangedSuccessful,
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
          ChangePassCubit changePassCubit = ChangePassCubit.get(context);
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
                        S.of(context).changePassword,
                        style: CustomTextStyle.kTextStyleF26.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gap(30.h),
                      CustomFormField(
                        stream: changePassCubit.newPassStream,
                        onChanged: (newPass) {
                          changePassCubit.validateNewPass(newPass);
                        },
                        label: S.of(context).newPassword,
                        nextAction: TextInputAction.next,
                      ),
                      Gap(10.h),
                      CustomFormField(
                        stream: changePassCubit.newPassConfStream,
                        onChanged: (newPassConf) {
                          changePassCubit.validateNewPassConf(newPassConf);
                        },
                        label: S.of(context).confirmNewPassword,
                        nextAction: TextInputAction.done,
                      ),
                      Gap(30.h),
                      ConditionalBuilder(
                        condition: state is! Loading,
                        builder: (context) => CustomBtn(
                          label: S.of(context).updatePassword,
                          onPressed: () {
                            changePassCubit.userChangePass(
                              ChangePassEntity(
                                email: widget.email,
                                pass: changePassCubit.newPassCtrl.value,
                                passConf: changePassCubit.newPassConfCtrl.value,
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
            ),
          );
        },
      ),
    );
  }
}
