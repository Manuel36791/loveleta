import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../widgets/track_tile.dart';

class TrackOrderView extends StatefulWidget {
  // final OrderEntity orderDetails;

  const TrackOrderView({
    super.key,
    // required this.orderDetails,
  });

  @override
  State<TrackOrderView> createState() => _TrackOrderViewState();
}

class _TrackOrderViewState extends State<TrackOrderView> {
  var time = TimeOfDay.now();
  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
                        "Estimated time of arrival (ETA)",
                        style: CustomTextStyle.kTextStyleF12
                            .copyWith(color: AppColors.textGrey,
                        fontWeight: FontWeight.w700,),
                      ),
                      Text(
                        "Updated at ${time.stringFormat(
                            formatType: TimeFormatType.hoursMinutesPeriod)}",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cancel Order",
                                    style: CustomTextStyle.kTextStyleF16,
                                  ),
                                  Gap(24.h),
                                  GestureDetector(
                                    onTap: () {
                                      // trackOrderCubit.cancelOrder(
                                      //   const CancelOrderEntity(
                                      //     orderId: 1,
                                      //   ),
                                      // );
                                    },
                                    child: Container(
                                      padding:
                                          const EdgeInsets.all(Dimensions.p20),
                                      decoration: BoxDecoration(
                                        color: AppColors.statusRedContainer,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.r10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Yes, Cancel",
                                          style: CustomTextStyle.kTextStyleF16
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
                                      padding:
                                          const EdgeInsets.all(Dimensions.p20),
                                      decoration: BoxDecoration(
                                        // color: AppColors.statusRedContainer,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.r10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "No, Close",
                                          style: CustomTextStyle.kTextStyleF16
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
                        borderRadius: BorderRadius.circular(Dimensions.r50),
                      ),
                      child: Text(
                        "Cancel Order",
                        style: CustomTextStyle.kTextStyleF12.copyWith(
                          color: AppColors.errorColor,
                        ),
                      ),
                    ),
                  ),
                  // StatusIndicator(
                  //   statusText: "تم التوصيل",
                  //   textColor: AppColors.statusGreen,
                  //   containerColor: AppColors.statusGreenContainer,
                  // )
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
                          "Track Order",
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                        Text(
                          "#23456789",
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
                          "Amount: 2",
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
                                  "Total",
                                  style: CustomTextStyle.kTextStyleF12.copyWith(
                                    color: AppColors.textGrey,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Gap(5.w),
                                Text(
                                  "189.00 SAR",
                                  style: CustomTextStyle.kTextStyleF12.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              date.stringFormat(DateFormatType.shortDate),
                              style: CustomTextStyle.kTextStyleF12.copyWith(
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
                      date: date.toString(),
                    ),
                    Gap(55.h),
                    TrackTile(
                      message: "Order preparation",
                      date: date.toString(),
                    ),
                    Gap(55.h),
                    TrackTile(
                      message: "Your order is ready for delivery",
                      date: date.toString(),
                    ),
                    Gap(55.h),
                    TrackTile(
                      message: "Order successfully delivered",
                      date: date.toString(),
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
  }
}
