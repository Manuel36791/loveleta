import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/router/router.dart';

import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../user_orders/domain/entities/order_entity.dart';
import '../../domain/entities/cancel_order_entity.dart';
import '../manager/cancel_order_cubit.dart';
import '../widgets/track_tile.dart';

class TrackOrderView extends StatefulWidget {
  final OrderEntity orderDetails;

  const TrackOrderView({
    super.key,
    required this.orderDetails,
  });

  @override
  State<TrackOrderView> createState() => _TrackOrderViewState();
}

class _TrackOrderViewState extends State<TrackOrderView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<CancelOrderCubit>(),
      child: BlocConsumer<CancelOrderCubit, CancelOrderStates>(
        listener: (context, state) {
          state.maybeMap(
            cancelSuccess: (state) {
              context.pushNamed(ordersPageRoute);
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          CancelOrderCubit cancelOrderCubit = CancelOrderCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(context: context),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(
                  Dimensions.p16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaxGap(35.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).eta,
                              style: CustomTextStyle.kTextStyleF12.copyWith(
                                color: AppColors.textGrey,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              S.of(context).updatedAt(
                                  DateTime.parse(widget.orderDetails.updatedAt!)
                                      .stringFormat(DateFormatType.timeOnly)),
                              style: CustomTextStyle.kTextStyleF16.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (ctx) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Dimensions.p16,
                                        vertical: Dimensions.p25),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).cancelOrder,
                                          style: CustomTextStyle.kTextStyleF16,
                                        ),
                                        Gap(24.h),
                                        GestureDetector(
                                          onTap: () {
                                            cancelOrderCubit.cancelOrder(
                                              CancelOrderEntity(
                                                orderId:
                                                    widget.orderDetails.id!,
                                              ),
                                            );
                                            context.pop();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(
                                                Dimensions.p20),
                                            decoration: BoxDecoration(
                                              color:
                                                  AppColors.statusRedContainer,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.r10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                S.of(context).yesCancel,
                                                style: CustomTextStyle
                                                    .kTextStyleF16
                                                    .copyWith(
                                                  color: AppColors.statusRed,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Gap(10.h),
                                        GestureDetector(
                                          onTap: () {
                                            context.pop();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(
                                                Dimensions.p20),
                                            decoration: BoxDecoration(
                                              // color: AppColors.statusRedContainer,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.r10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                S.of(context).noClose,
                                                style: CustomTextStyle
                                                    .kTextStyleF16
                                                    .copyWith(
                                                  color: AppColors.textGrey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.p8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.errorColor,
                              ),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.r50),
                            ),
                            child: Text(
                              "Cancel Order",
                              style: CustomTextStyle.kTextStyleF12.copyWith(
                                color: AppColors.errorColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(25.h),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.p16, vertical: Dimensions.p25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimensions.r15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).trackOrder,
                                style: CustomTextStyle.kTextStyleF14,
                              ),
                              Text(
                                "#${widget.orderDetails.id}",
                                style: CustomTextStyle.kTextStyleF14.copyWith(
                                  color: AppColors.textGrey,
                                ),
                              ),
                            ],
                          ),
                          Gap(25.h),
                          const Divider(thickness: 2.0),
                          Gap(16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).amount,
                                style: CustomTextStyle.kTextStyleF12.copyWith(
                                  color: AppColors.textGrey,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        S.of(context).total,
                                        style: CustomTextStyle.kTextStyleF12
                                            .copyWith(
                                          color: AppColors.textGrey,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Gap(5.w),
                                      Text(
                                        S.of(context).price(widget.orderDetails.totalPrice.toString()),
                                        style: CustomTextStyle.kTextStyleF12
                                            .copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    DateTime.parse(widget.orderDetails.updatedAt!).stringFormat(DateFormatType.shortDate),
                                    style:
                                        CustomTextStyle.kTextStyleF12.copyWith(
                                      color: AppColors.textGrey,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Gap(16.h),
                          TrackTile(
                            message: "Order accepted",
                            date: widget.orderDetails.updatedAt!,
                          ),
                          Gap(55.h),
                          TrackTile(
                            message: "Order preparation",
                            date: widget.orderDetails.updatedAt!,
                          ),
                          Gap(55.h),
                          TrackTile(
                            message: "Your order is ready for delivery",
                            date: widget.orderDetails.updatedAt!,
                          ),
                          Gap(55.h),
                          TrackTile(
                            message: "Order successfully delivered",
                            date: widget.orderDetails.updatedAt!,
                          ),
                          Gap(55.h),
                        ],
                      ),
                    )
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
