import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/shared/widgets/status_indicator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/shared/arguments.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../domain/entities/order_entity.dart';

class OrderContainer extends StatelessWidget {
  final OrderEntity? order;

  const OrderContainer({
    super.key,
    this.order,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        context.pushNamed(
          orderDetailsPageRoute,
          arguments: OrderDetailsArgs(
            orderDetails: order!,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(Dimensions.p20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(Dimensions.r10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).orderNumber(order!.orderNo!),
                  style: CustomTextStyle.kTextStyleF14,
                ),
                order!.status == 3 ?   StatusIndicator(
                  statusText: S.of(context).delivered,
                  textColor: AppColors.statusGreen,
                  containerColor: AppColors.statusGreenContainer,
                ) : order!.status == 4 ?  StatusIndicator(
                  statusText: S.of(context).cancelled,
                  textColor: AppColors.statusRed,
                  containerColor: AppColors.statusRedContainer,
                ) :  StatusIndicator(
                  statusText: S.of(context).processing,
                  textColor: AppColors.statusOrange,
                  containerColor: AppColors.statusOrangeContainer,
                ),
              ],
            ),
            Gap(10.h),
            const Divider(thickness: 2.0),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                     "${ S.of(context).total}:",
                      style: CustomTextStyle.kTextStyleF12,
                    ),
                    Text(
                      S.of(context).price(order!.totalPrice.toString()),
                      style: CustomTextStyle.kTextStyleF12,
                    ),
                  ],
                ),
                Text(S.of(context).qty(order!.products!.length),
                    style: CustomTextStyle.kTextStyleF12),
              ],
            ),
            Gap(20.h),
            Text(
              DateTime.parse(
                order!.updatedAt!,
              ).stringFormat(
                DateFormatType.hyphenatedDate,
              ),
              style: CustomTextStyle.kTextStyleF12.copyWith(
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
