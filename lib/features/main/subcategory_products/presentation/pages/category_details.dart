import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/dependency_injection/di.dart' as di;
import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/shared/widgets/product_card.dart';
import '../../../../../core/shared/widgets/state_error_widget.dart';
import '../../../../../core/shared/widgets/state_loading_widget.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../domain/entities/subcategory_products_entity.dart';
import '../manager/subcategory_products_cubit.dart';

class SubCategoryProductsView extends StatefulWidget {
  final num id;

  const SubCategoryProductsView({
    super.key,
    required this.id,
  });

  @override
  State<SubCategoryProductsView> createState() => _SubCategoryProductsViewState();
}

class _SubCategoryProductsViewState extends State<SubCategoryProductsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.di<SubCategoryProductsCubit>()
        ..getSubCategoryProducts(
          SubCategoryProductsEntity(
            id: widget.id,
          ),
        ),
      child: BlocConsumer<SubCategoryProductsCubit, SubCategoryProductsStates>(
        listener: (context, state) {},
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
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.productsList!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: Dimensions.p16,
                        crossAxisSpacing: Dimensions.p16,
                        mainAxisExtent: 250.h,
                      ),
                      itemBuilder: (_, index) => Align(
                        alignment: Alignment.center,
                        child: ProductCard(
                          product: state.productsList![index],
                        ),
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
            ),
          );
        },
      ),
    );
  }
}
