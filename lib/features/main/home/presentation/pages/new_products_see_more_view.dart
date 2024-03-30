import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared/entities/product_entity.dart';
import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/shared/widgets/product_card.dart';
import '../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../core/utils/dimensions.dart';
import '../manager/new_products_cubit/new_products_cubit.dart';

class NewProductsSeeMoreView extends StatefulWidget {
  const NewProductsSeeMoreView({super.key});

  @override
  State<NewProductsSeeMoreView> createState() => _NewProductsSeeMoreViewState();
}

class _NewProductsSeeMoreViewState extends State<NewProductsSeeMoreView> {
  ScrollController scrollController = ScrollController();
  int nextPage = 1;
  bool isLoading = false;
  List<ProductEntity> productsList = [];

  void scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewProductsCubit>(context)
            .getNewProducts(++nextPage);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewProductsCubit, NewProductsStates>(
      listener: (context, state) {
        state.maybeWhen(
          success: (state) {
            productsList.addAll(state);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(context: context),
          body: SafeArea(
            child: state.maybeWhen(
              loading: () {
                return const Align(
                  alignment: Alignment.center,
                  child: StateLoadingWidget(),
                );
              },
              success: (state) {
                return Padding(
                  padding: const EdgeInsets.all(Dimensions.p16),
                  child: GridView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: productsList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: Dimensions.p16,
                      crossAxisSpacing: Dimensions.p16,
                      mainAxisExtent: 250.h,
                    ),
                    itemBuilder: (ctx, index) =>
                        Align(
                          alignment: Alignment.center,
                          child: ProductCard(
                            product: productsList[index],
                          ),
                        ),
                  ),
                );
              },
              paginationLoading: () {
                return Padding(
                  padding: const EdgeInsets.all(Dimensions.p16),
                  child: GridView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: productsList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: Dimensions.p16,
                      crossAxisSpacing: Dimensions.p16,
                      mainAxisExtent: 250.h,
                    ),
                    itemBuilder: (ctx, index) =>
                        Align(
                          alignment: Alignment.center,
                          child: ProductCard(
                            product: productsList[index],
                          ),
                        ),
                  ),
                );
              },
              paginationError: (errCode, err) {
                {
                  return Padding(
                    padding: const EdgeInsets.all(Dimensions.p16),
                    child: GridView.builder(
                      controller: scrollController,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: productsList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: Dimensions.p16,
                        crossAxisSpacing: Dimensions.p16,
                        mainAxisExtent: 250.h,
                      ),
                      itemBuilder: (ctx, index) =>
                          Align(
                            alignment: Alignment.center,
                            child: ProductCard(
                              product: productsList[index],
                            ),
                          ),
                    ),
                  );
                }
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
          ),
        );
      },
    );
  }
}
