import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/shared/widgets/status_indicator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/app_text_styles.dart';

class OrderContainer extends StatelessWidget {
  // final OrderEntity? orderEntity;

  const OrderContainer({
    super.key,
    // this.orderEntity,
  });


  @override
  Widget build(BuildContext context) {
    List<String> statusList = [
      "In Progress",
      "Delivered",
      "Cancelled",
    ];

    return GestureDetector(
      onTap: () {
        // context.pushNamed(
        //   orderDetailsPageRoute,
        //   arguments: OrderDetailsArgs(
        //     orderDetails: orderEntity!,
        //   ),
        // );
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
                  "Order Number #2563589",
                  style: CustomTextStyle.kTextStyleF14,
                ),
                StatusIndicator(
                  statusText: statusList[1],
                  textColor: AppColors.statusGreen,
                  containerColor: AppColors.statusGreenContainer,
                )
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
                      "Total: ",
                      style: CustomTextStyle.kTextStyleF12,
                    ),
                    Text(
                      "820 SAR",
                      style: CustomTextStyle.kTextStyleF12,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "QTY: ",
                      style: CustomTextStyle.kTextStyleF12
                    ),
                    Text(
                      2.toString(),
                      style: CustomTextStyle.kTextStyleF12,
                    ),
                  ],
                ),
              ],
            ),
            Gap(20.h),
            Text(
              DateTime.parse(
                "2022-10-10 10:10:10",
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
