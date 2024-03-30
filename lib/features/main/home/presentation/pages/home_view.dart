import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loveleta/core/router/router.dart';
import 'package:loveleta/core/shared/arguments.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:loveleta/features/main/home/presentation/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/shared/widgets/product_card.dart';
import '../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../categories/domain/entities/category_entity.dart';
import '../../../categories/presentation/manager/category_cubit.dart';
import '../manager/new_products_cubit/new_products_cubit.dart';
import '../manager/products_by_category/products_by_category_cubit.dart';
import '../widgets/category_container.dart';
import '../widgets/section_title.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        if (Platform.isAndroid) {
          SystemNavigator.pop();
          return;
        } else if (Platform.isIOS) {
          exit(0);
        } else {
          return;
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.di<CategoryCubit>()..getCategories(),
          ),
          BlocProvider(
            create: (context) => di.di<ProductsByCategoryCubit>(),
          ),
          BlocProvider(
            create: (context) => di.di<NewProductsCubit>()..getNewProducts(1),
          ),
          BlocProvider(
            create: (context) => di.di<BestSellerCubit>()..getBestSellers(1),
          ),
        ],
        child: BlocConsumer<CategoryCubit, CategoryStates>(
          listener: (context, state) {
            ProductsByCategoryCubit productsCubit =
                ProductsByCategoryCubit.get(context);
            state.maybeWhen(
              orElse: () {},
              success: (state) {
                for (int i = 1; i <= state.length - 1; i++) {
                  productsCubit.getProductsByCategory(
                    CategoryEntity(
                      id: state[i].id,
                    ),
                  );
                }
              },
            );
          },
          builder: (context, state) {
            return Scaffold(
              appBar: CustomAppBar(context: context),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.p16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(20.h),
                        Container(
                          width: context.queryWidth.w,
                          padding: const EdgeInsets.all(Dimensions.p8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(Dimensions.r5),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                MdiIcons.magnify,
                                size: Dimensions.f22,
                              ),
                              Gap(10.w),
                              Text(
                                "Search For gifts, flowers Cakes...",
                                style: CustomTextStyle.kTextStyleF14.copyWith(
                                  color: AppColors.textGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(20.h),
                        SectionTitle(
                          sectionTitle: "New Arrivals",
                          onTap: () {
                            context.pushNamed(newProductsPageRoute);
                          },
                        ),
                        Gap(20.h),
                        BlocConsumer<NewProductsCubit, NewProductsStates>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () {
                                return const StateLoadingWidget();
                              },
                              success: (state) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      ...List.generate(
                                        state.length,
                                        (index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(
                                                Dimensions.p10),
                                            child: ProductCard(
                                              product: state[index],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                              error: (errCode, err) {
                                return StateErrorWidget(
                                  errCode: errCode,
                                  err: err,
                                );
                              },
                              orElse: () => const SizedBox.shrink(),
                            );
                          },
                        ),
                        Gap(20.h),
                        SectionTitle(
                          sectionTitle: "Best Sellers",
                          onTap: () {
                            context.pushNamed(bestSellerPageRoute);
                          },
                        ),
                        Gap(20.h),
                        BlocConsumer<BestSellerCubit, BestSellerStates>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () {
                                return const StateLoadingWidget();
                              },
                              success: (state) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      ...List.generate(
                                        state.length,
                                        (index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(
                                                Dimensions.p10),
                                            child: ProductCard(
                                              product: state[index],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                              error: (errCode, err) {
                                return StateErrorWidget(
                                  errCode: errCode,
                                  err: err,
                                );
                              },
                              orElse: () => const SizedBox.shrink(),
                            );
                          },
                        ),
                        Gap(20.h),
                        state.maybeWhen(
                          loading: () {
                            return const StateLoadingWidget();
                          },
                          success: (state) {
                            return Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      ...List.generate(
                                        state.length,
                                        (index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(
                                                Dimensions.p10),
                                            child: CategoryContainer(
                                              category: state[index],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    ...List.generate(
                                      state.length,
                                      (index) => Column(
                                        children: [
                                          SectionTitle(
                                            sectionTitle: state[index].nameEn,
                                            onTap: () {
                                              context.pushNamed(
                                                seeMorePageRoute,
                                                arguments: SeeMoreArgs(
                                                  id: state[index].id,
                                                ),
                                              );
                                            },
                                          ),
                                          Gap(20.h),
                                          BlocConsumer<ProductsByCategoryCubit,
                                              ProductsByCategoryStates>(
                                            listener: (context, state) {},
                                            builder: (context, state) {
                                              return state.maybeWhen(
                                                loading: () {
                                                  return const StateLoadingWidget();
                                                },
                                                loaded: (state2) {
                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      children: [
                                                        ...List.generate(
                                                          state2.length,
                                                          (index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      Dimensions
                                                                          .p10),
                                                              child:
                                                                  ProductCard(
                                                                product: state2[
                                                                    index],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                error: (errCode, err) {
                                                  return StateErrorWidget(
                                                    errCode: errCode,
                                                    err: err,
                                                  );
                                                },
                                                orElse: () =>
                                                    const SizedBox.shrink(),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
              ),
            );
          },
        ),
      ),
    );
  }
}
