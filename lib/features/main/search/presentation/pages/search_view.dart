import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/utils/dimensions.dart';
import '../../../../../core/shared/entities/product_entity.dart';
import '../../../../../core/shared/widgets/custom_form_field.dart';
import '../../../../../core/shared/widgets/product_card.dart';
import '../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../domain/entities/search_entity.dart';
import '../manager/search_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchCtrl = TextEditingController();
  ScrollController scrollController = ScrollController();

  var nextPage = 1;
  var isLoading = false;
  List<ProductEntity> products = [];

  void scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<SearchCubit>(context).searchProducts(
          SearchEntity(
            searchText: searchCtrl.text,
            nextPage: nextPage++,
          ),
        );
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {
        state.maybeWhen(
          success: (state) {
            products.addAll(state);
          },
          orElse: () {
            return null;
          },
        );
      },
      builder: (context, state) {
        SearchCubit searchCubit = SearchCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.p16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(20.h),
                    CustomFormField(
                      label: S.of(context).search,
                      stream: Stream.empty(),
                      onChanged: (value) {
                        searchCubit.searchProducts(
                          SearchEntity(
                            searchText: searchCtrl.text,
                            nextPage: nextPage,
                          ),
                        );
                      },
                    ),
                    Gap(20.h),
                    state.maybeWhen(
                      loading: () {
                        return const StateLoadingWidget();
                      },
                      success: (state) {
                        return AutoHeightGridView(
                          // controller: scrollController,
                          itemCount: products.length,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(Dimensions.p10),
                          shrinkWrap: true,
                          builder: (context, index) {
                            return ProductCard(
                              product: products[index],
                            );
                          },
                        );
                      },
                      paginationLoading: () {
                        return AutoHeightGridView(
                          // controller: scrollController,
                          itemCount: products.length,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(Dimensions.p10),
                          shrinkWrap: true,
                          builder: (context, index) {
                            return ProductCard(
                              product: products[index],
                            );
                          },
                        );
                      },
                      paginationError: (errCode, err) {
                        return AutoHeightGridView(
                          // controller: scrollController,
                          itemCount: products.length,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(Dimensions.p10),
                          shrinkWrap: true,
                          builder: (context, index) {
                            return ProductCard(
                              product: products[index],
                            );
                          },
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
    );
  }
}
