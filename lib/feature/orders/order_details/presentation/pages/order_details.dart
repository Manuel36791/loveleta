import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/utils/extensions.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';
import '../widgets/order_product_card.dart';

class OrderDetailsView extends StatefulWidget {
  // final OrderEntity orderDetails;

  // final String? orderNo;
  const OrderDetailsView({
    super.key,
    // required this.orderDetails,
  });

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                Dimensions.p16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Arriving to",
                        style: CustomTextStyle.kTextStyleF16,
                      ),
                      TextButton(
                        onPressed: () {
                          // context.pushNamed(
                          //   trackOrderPageRoute,
                          //   arguments: OrderDetailsArgs(
                          //     orderDetails: widget.orderDetails,
                          //   ),
                          // );
                        },
                        child: Text(
                          "Track order",
                          style: CustomTextStyle.kTextStyleF16,
                        ),
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimensions.p16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppImages.pinSvg,
                                height: 16.h,
                                width: 16.w,
                              ),
                              Gap(8.w),
                              Expanded(
                                child: Text(
                                  "555 Smith Street, Springfield, IL 62701, United States.",
                                  style: CustomTextStyle.kTextStyleF12,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Gap(12.h),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.personSvg,
                                height: 16.h,
                                width: 16.w,
                              ),
                              Gap(8.w),
                              Text(
                                "John Doe",
                                style: CustomTextStyle.kTextStyleF12,
                              ),
                            ],
                          ),
                          Gap(12.h),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.phoneSvg,
                                height: 16.h,
                                width: 16.w,
                              ),
                              Gap(8.w),
                              Text(
                                "+1 (555) 123-4567",
                                style: CustomTextStyle.kTextStyleF12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(20.h),
                  Text(
                    "Executed Request",
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                  Gap(15.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (ctx, index) {
                      return const OrderProductCard(
                          imageUrl: "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                          productName: "Product Name",
                         price: 760,
                         quantity: 2,
                      );
                    },)
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                width: context.queryWidth.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Dimensions.p25,
                    ),
                    topRight: Radius.circular(
                      Dimensions.p25,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Track Order",
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                        Text("#kloth-12345",
                            style: CustomTextStyle.kTextStyleF14),
                      ],
                    ),
                    Gap(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                        Text(
                            "820 SAR",
                            style: CustomTextStyle.kTextStyleF14),
                      ],
                    ),
                    Gap(15.h),
                    const Divider(
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                            color: AppColors.textGrey,
                          ),
                        ),
                        Text(
                          "760 SAR",
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                      ],
                    ),
                    Gap(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery fee",
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                            color: AppColors.textGrey,
                          ),
                        ),
                        Text("40 SAR",
                            style: CustomTextStyle.kTextStyleF14),
                      ],
                    ),
                    Gap(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tax",
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                            color: AppColors.textGrey,
                          ),
                        ),
                        Text("20 SAR",
                            style: CustomTextStyle.kTextStyleF14),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
