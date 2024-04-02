import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../../core/shared/models/user_data_model.dart';
import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../domain/entities/order_entity.dart';
import '../manager/user_orders_cubit.dart';
import '../widgets/order_container.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  int status = 0;
  List<String> statusList = [
    S.current.pending,
    S.current.processing,
    S.current.shipped,
    S.current.delivered,
    S.current.cancelled,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<UserOrdersCubit>()
        ..getMyOrders(
          OrderEntity(
            userId: UserData.id,
            // orderFilter: status,
          ),
        ),
      child: BlocConsumer<UserOrdersCubit, UserOrdersStates>(
        listener: (context, state) {},
        builder: (context, state) {
          UserOrdersCubit ordersCubit = UserOrdersCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(context: context),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(
                  Dimensions.p16,
                ),
                child: Column(
                  children: [
                    Gap(20.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                            statusList.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.p5.w),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    status = index;
                                  });
                                  ordersCubit.getMyOrders(
                                    OrderEntity(
                                      userId: UserData.id,
                                      // orderFilter: status,
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 35.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.p16.w,
                                      vertical: Dimensions.p5.h),
                                  decoration: BoxDecoration(
                                    color: status == index
                                        ? AppColors.pinkPrimary
                                        : AppColors.textWhite,
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.r10),
                                    border: Border.all(
                                      color: AppColors.pinkPrimary,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      statusList[index],
                                      style: CustomTextStyle.kTextStyleF14
                                          .copyWith(
                                        color: status == index
                                            ? Colors.white
                                            : AppColors.pinkPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(20.h),
                    state.maybeWhen(
                      loading: () {
                        return const StateLoadingWidget();
                      },
                      success: (state) {
                        return state.isNotEmpty
                            ? Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: state.length,
                                  itemBuilder: (ctx, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: Dimensions.p8),
                                      child: OrderContainer(
                                        order: state[index],
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Expanded(
                                child: Center(
                                  child: Text(
                                    S.of(context).youHaveNoOrdersYet,
                                    style: CustomTextStyle.kTextStyleF18,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                      },
                      error: (errCode, err) {
                        return StateErrorWidget(
                          errCode: errCode,
                          err: err,
                        );
                      },
                      orElse: () {
                        return const SizedBox.shrink();
                      },
                    ),
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
