import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:loveleta/core/router/router.dart';
import 'package:loveleta/core/shared/arguments.dart';
import 'package:loveleta/core/utils/extensions.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../core/shared/models/user_data_model.dart';
import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';
import '../../../user_orders/domain/entities/order_entity.dart';
import '../widgets/order_product_card.dart';

class OrderDetailsView extends StatefulWidget {
  final OrderEntity orderDetails;

  const OrderDetailsView({
    super.key,
    required this.orderDetails,
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).arrivingTo,
                          style: CustomTextStyle.kTextStyleF16,
                        ),
                        TextButton(
                          onPressed: () {
                            context.pushNamed(trackOrderPageRoute, arguments: OrderDetailsArgs(
                              orderDetails: widget.orderDetails,
                            ));
                          },
                          child: Text(
                            S.of(context).trackOrder,
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
                                SvgPicture.asset(
                                  AppImages.pinSvg,
                                  height: 16.h,
                                  width: 16.w,
                                ),
                                Gap(8.w),
                                Expanded(
                                  child: Text(
                                    "${widget.orderDetails.shippingAddress!.building} ${widget.orderDetails.shippingAddress!.address}, ${widget.orderDetails.shippingAddress!.city}, ${widget.orderDetails.shippingAddress!.code}, ${widget.orderDetails.shippingAddress!.country}",
                                    style: CustomTextStyle.kTextStyleF12,
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Gap(12.h),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.personSvg,
                                  height: 16.h,
                                  width: 16.w,
                                ),
                                Gap(8.w),
                                Text(
                                  "${UserData.firstName} ${UserData.lastName}",
                                  style: CustomTextStyle.kTextStyleF12,
                                ),
                              ],
                            ),
                            Gap(12.h),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.phoneSvg,
                                  height: 16.h,
                                  width: 16.w,
                                ),
                                Gap(8.w),
                                Text(
                                  "${UserData.phone}",
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
                      S.of(context).executedRequest,
                      style: CustomTextStyle.kTextStyleF16,
                    ),
                    Gap(15.h),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.orderDetails.products!.length,
                      itemBuilder: (ctx, index) {
                        return OrderProductCard(
                          imageUrl: widget.orderDetails.products![index].mainImage,
                          productName: Intl.getCurrentLocale() == "en" ? widget.orderDetails.products![index].nameEn : widget.orderDetails.products![index].nameAr,
                          price: widget.orderDetails.totalPrice,
                          quantity: widget.orderDetails.products!.length,
                        );
                      },),
                    Gap(250.h),
                  ],
                ),
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
                          S.of(context).trackOrder,
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                        Text("#${widget.orderDetails.orderNo}",
                            style: CustomTextStyle.kTextStyleF14),
                      ],
                    ),
                    Gap(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).total,
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                        Text(
                            S.of(context).price(widget.orderDetails.totalPrice.toString()),
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
                          S.of(context).subtotal,
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                            color: AppColors.textGrey,
                          ),
                        ),
                        Text(
                          S.of(context).price(widget.orderDetails.subTotalPrice.toString()),
                          style: CustomTextStyle.kTextStyleF14,
                        ),
                      ],
                    ),
                    Gap(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).deliveryFee,
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                            color: AppColors.textGrey,
                          ),
                        ),
                        Text(
                            S.of(context).price(widget.orderDetails.shippingCost.toString()),
                            style: CustomTextStyle.kTextStyleF14),
                      ],
                    ),
                    Gap(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).tax,
                          style: CustomTextStyle.kTextStyleF14.copyWith(
                            color: AppColors.textGrey,
                          ),
                        ),
                        Text(

                            S.of(context).price(widget.orderDetails.tax.toString()),
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