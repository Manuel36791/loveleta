import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../core/database/address_class.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../manager/place_order_cubit.dart';

class PaymentSummaryView extends StatefulWidget {
  final Address address;

  const PaymentSummaryView({
    super.key,
    required this.address,
  });

  @override
  State<PaymentSummaryView> createState() => _PaymentSummaryViewState();
}

class _PaymentSummaryViewState extends State<PaymentSummaryView> {
  bool isCoupon = false;
  num totalWithCoupon = 0;
  TextEditingController pinCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final cartItems = context.watch<CartCubit>().products!;
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Confirm Order",
                      style: CustomTextStyle.kTextStyleF20,
                    ),
                    Gap(10.h),
                    Text(
                      "Please confirm & proceed with your order",
                      style: CustomTextStyle.kTextStyleF14,
                    ),
                    Gap(15.h),
                    Container(
                      padding: const EdgeInsets.all(Dimensions.p16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimensions.r10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Recipient info",
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                            ],
                          ),
                          Gap(10.h),
                          Text(
                            "Name:",
                            style: CustomTextStyle.kTextStyleF12.copyWith(
                              color: AppColors.textGrey,
                            ),
                          ),
                          Gap(5.h),
                          Text(
                            "${UserData.firstName!} ${UserData.lastName!}",
                            style: CustomTextStyle.kTextStyleF14,
                          ),
                          Gap(10.h),
                          Text(
                            "Phone:",
                            style: CustomTextStyle.kTextStyleF12.copyWith(
                              color: AppColors.textGrey,
                            ),
                          ),
                          Gap(5.h),
                          Text(
                            UserData.phone!,
                            style: CustomTextStyle.kTextStyleF14,
                          ),
                          Gap(10.h),
                          Text(
                            "Address: ",
                            style: CustomTextStyle.kTextStyleF12.copyWith(
                              color: AppColors.textGrey,
                            ),
                          ),
                          Gap(5.h),
                          Text(
                            widget.address.address!,
                            style: CustomTextStyle.kTextStyleF14,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              insetPadding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.p16,
                                  vertical: Dimensions.p32),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Gap(35.h),
                                  Text(
                                    "Add promo code",
                                    style: CustomTextStyle.kTextStyleF20,
                                  ),
                                  Text(
                                    "Enter your promo code",
                                    style:
                                        CustomTextStyle.kTextStyleF12.copyWith(
                                      color: AppColors.textPink,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Gap(35.h),
                                  Pinput(
                                    controller: pinCtrl,
                                    onChanged: (value) {
                                      // UserData.otp = value;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp("[a-z A-Z á-ú Á-Ú 0-9]"),
                                      ),
                                    ],
                                    closeKeyboardWhenCompleted: false,
                                    onSubmitted: (value) {},
                                    keyboardType: TextInputType.text,
                                    length: 4,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  Gap(35.h),
                                  ConditionalBuilder(
                                      condition: true,
                                      builder: (BuildContext ctx) {
                                        return CustomBtn(
                                          label: "Apply coupon",
                                          onPressed: () {
                                            context.pop();
                                          },
                                        );
                                      },
                                      fallback: (BuildContext ctx) {
                                        return const StateLoadingWidget();
                                      })
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        "Add promo code",
                        style: CustomTextStyle.kTextStyleF14.copyWith(
                          color: AppColors.pinkSecondary,
                        ),
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.all(Dimensions.p16),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(Dimensions.r10),
                    //   ),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(
                    //             S.current.payment,
                    //             style: CustomTextStyle.kTextStyleF14,
                    //           ),
                    //
                    //         ],
                    //       ),
                    //       Gap(20.h),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Row(
                    //             children: [
                    //               const Text("***** 6714"),
                    //               Gap(10.w),
                    //               Image.asset(
                    //                 AppImages.visaImg,
                    //                 height: 32.h,
                    //                 width: 32.w,
                    //                 fit: BoxFit.contain,
                    //               ),
                    //             ],
                    //           ),
                    //           Text(
                    //             "01/24",
                    //             style: CustomTextStyle.kTextStyleF12.copyWith(
                    //               color: AppColors.textColorSecondary,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Gap(10.h),
                    Container(
                      padding: const EdgeInsets.all(Dimensions.p16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimensions.r10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Summary",
                            style: CustomTextStyle.kTextStyleF14,
                          ),
                          Gap(15.h),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Total",
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                              const Spacer(),
                              Text(
                                "${S.current.sar}",
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                            ],
                          ),
                          Gap(15.h),
                          Container(
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0x14010C0E),
                                ),
                              ),
                            ),
                          ),
                          Gap(15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                              const Spacer(),
                              Text(
                                "${S.current.sar}",
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                            ],
                          ),
                          Gap(15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery Fee",
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                              const Spacer(),
                              Text(
                                '${S.current.sar}',
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                            ],
                          ),
                          Gap(15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tax",
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                              const Spacer(),
                              Text(
                                ' ${S.current.sar}',
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Gap(100.h),
                  ],
                ),
              ),
            ),
            BlocProvider(
              create: (context) => di.di<PlaceOrderCubit>(),
              child: BlocConsumer<PlaceOrderCubit, PlaceOrderStates>(
                listener: (context, state) {
                  PlaceOrderCubit placeOrderCubit =
                      PlaceOrderCubit.get(context);
                  state.maybeWhen(
                    success: (state) {
                      // placeOrderCubit.paymentLauncher(state.paymentUrl!);
                      context.defaultSnackBar(
                          "Order placed successfully, now redirecting to payment");
                      // context.pushNamed(orderConfirmationPageRoute);
                      // cartItems.clear();
                    },
                    orElse: () {
                      return null;
                    },
                  );
                },
                builder: (context, state) {
                  PlaceOrderCubit placeOrderCubit =
                      PlaceOrderCubit.get(context);
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      child: CustomBtn(
                        label: "Place Order",
                        onPressed: () async {

                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
