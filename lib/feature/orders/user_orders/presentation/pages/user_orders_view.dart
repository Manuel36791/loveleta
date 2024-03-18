import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../widgets/order_container.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  int status = 0;
  List<String> statusList = [
    "In Progress",
    "Delivered",
    "Cancelled",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            Dimensions.p16,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(20.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            status = 0;
                          });
                          // ordersCubit.getMyOrders(
                          //   OrderEntity(
                          //     userId: UserData.id,
                          //     orderFilter: status,
                          //   ),
                          // );
                        },
                        child: Container(
                          height: 35.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.p16.w,
                              vertical: Dimensions.p5.h),
                          decoration: BoxDecoration(
                            color: AppColors.pinkPrimary,
                            borderRadius: BorderRadius.circular(Dimensions.r10),
                            border: Border.all(
                              color: AppColors.pinkPrimary,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "In Progress",
                              style: CustomTextStyle.kTextStyleF14.copyWith(
                                color: AppColors.textWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(10.h),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            status = 1;
                          });
                          // ordersCubit.getMyOrders(
                          //   OrderEntity(
                          //     userId: UserData.id,
                          //     orderFilter: status,
                          //   ),
                          // );
                        },
                        child: Container(
                          height: 35.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.p16.w,
                              vertical: Dimensions.p5.h),
                          decoration: BoxDecoration(
                            color: AppColors.pinkPrimary,
                            borderRadius: BorderRadius.circular(Dimensions.r10),
                            border: Border.all(
                              color: AppColors.pinkPrimary,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Delivered",
                              style: CustomTextStyle.kTextStyleF14.copyWith(
                                color: AppColors.textWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(10.h),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            status = 2;
                          });
                          // ordersCubit.getMyOrders(
                          //   OrderEntity(
                          //     userId: UserData.id,
                          //     orderFilter: status,
                          //   ),
                          // );
                        },
                        child: Container(
                          height: 35.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.p16.w,
                              vertical: Dimensions.p5.h),
                          decoration: BoxDecoration(
                            color: AppColors.pinkPrimary,
                            borderRadius: BorderRadius.circular(Dimensions.r10),
                            border: Border.all(
                              color: AppColors.pinkPrimary,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Cancelled",
                              style: CustomTextStyle.kTextStyleF14.copyWith(
                                color: AppColors.textWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: Dimensions.p8),
                      child: OrderContainer(
                          // orderEntity: state[index],
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
