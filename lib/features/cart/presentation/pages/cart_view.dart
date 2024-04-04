import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/utils/extensions.dart';

import '../../../../../../core/router/router.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../core/shared/cubits/cart_cubit/cart_cubit.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/cart_item.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) async {
            if (didPop) return;
            context.pushNamed(bottomNavBar);
          },
          child: Scaffold(
            appBar: CustomAppBar(context: context),
            body: SafeArea(
              child: context
                  .watch<CartCubit>()
                  .cartProducts
                  .isNotEmpty
                  ? Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.p16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: context
                                .watch<CartCubit>()
                                .cartProducts
                                .length,
                            itemBuilder: (ctx, index) {
                              final productItems = context
                                  .watch<CartCubit>()
                                  .cartProducts[index];
                              return CartItem(
                                  product: productItems);
                            },
                          ),
                          Gap(300.h),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(Dimensions.p16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(S.of(context).total,
                                  style: CustomTextStyle.kTextStyleF14),
                              const Spacer(),
                              Text(
                                "820 SAR",
                                style:
                                CustomTextStyle.kTextStyleF14.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          Gap(16.h),
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
                          Gap(16.h),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub total",
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                              const Spacer(),
                              Text(
                                "760 SAR",
                                style:
                                CustomTextStyle.kTextStyleF14.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          Gap(16.h),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).deliveryFee,
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                              const Spacer(),
                              Text(
                                "40 SAR",
                                style:
                                CustomTextStyle.kTextStyleF14.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          Gap(16.h),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).tax,
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                              const Spacer(),
                              Text(
                                "20 SAR",
                                style:
                                CustomTextStyle.kTextStyleF14.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          Gap(100.h),
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomBtn(
                        label: S.of(context).completePayment,
                        onPressed: () {
                          context.pushNamed(savedAddressesPageRoute);
                        },
                      ),
                    ),
                  ),
                ],
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      S.of(context).yourBagIsEmpty,
                      style: CustomTextStyle.kTextStyleF20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
