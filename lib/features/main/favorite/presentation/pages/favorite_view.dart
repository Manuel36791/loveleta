import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loveleta/core/utils/extensions.dart';

import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/product_card.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/shared/entities/product_entity.dart';
import '../../../../../core/shared/models/user_data_model.dart';
import '../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../domain/entities/favorite_entity.dart';
import '../manager/favorite_cubit.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
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
        await BlocProvider.of<FavoriteCubit>(context)
            .getAllFavorites(FavoriteEntity(
          userId: UserData.id,
          page: ++nextPage,
        ));
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) async {
            if (didPop) return;
            context.pushNamed(bottomNavBar);
          },
          child: Scaffold(
            appBar: CustomAppBar(context: context),
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(Dimensions.p16),
              child: state.maybeWhen(
                loading: () {
                  return const StateLoadingWidget();
                },
                success: (state) {
                  return productsList.isNotEmpty
                      ? GridView.builder(
                          padding: EdgeInsets.zero,
                          controller: scrollController,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: productsList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: Dimensions.p16,
                            crossAxisSpacing: Dimensions.p16,
                            mainAxisExtent: 250.h,
                          ),
                          itemBuilder: (_, index) => Align(
                            alignment: Alignment.center,
                            child: ProductCard(
                              product: productsList[index],
                            ),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "You don't have any favorite products",
                                style: CustomTextStyle.kTextStyleF20,
                              ),
                            ),
                          ],
                        );
                },
                paginationLoading: () {
                  return productsList.isNotEmpty
                      ? GridView.builder(
                          padding: EdgeInsets.zero,
                          controller: scrollController,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: productsList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: Dimensions.p16,
                            crossAxisSpacing: Dimensions.p16,
                            mainAxisExtent: 250.h,
                          ),
                          itemBuilder: (_, index) => Align(
                            alignment: Alignment.center,
                            child: ProductCard(
                              product: productsList[index],
                            ),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "You don't have any favorite products",
                                style: CustomTextStyle.kTextStyleF20,
                              ),
                            ),
                          ],
                        );
                },
                paginationError: (errCode, err) {
                  return productsList.isNotEmpty
                      ? GridView.builder(
                          padding: EdgeInsets.zero,
                          controller: scrollController,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: productsList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: Dimensions.p16,
                            crossAxisSpacing: Dimensions.p16,
                            mainAxisExtent: 250.h,
                          ),
                          itemBuilder: (_, index) => Align(
                            alignment: Alignment.center,
                            child: ProductCard(
                              product: productsList[index],
                            ),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "You don't have any favorite products",
                                style: CustomTextStyle.kTextStyleF20,
                              ),
                            ),
                          ],
                        );
                },
                error: (errCode, err) {
                  return StateErrorWidget(
                    errCode: errCode.isNullOrEmpty(),
                    err: err.isNullOrEmpty(),
                  );
                },
                orElse: () {
                  return const SizedBox.shrink();
                },
              ),
            )),
          ),
        );
      },
    );
  }
}
