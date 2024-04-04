import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/subcategory_products_entity.dart';
import '../../domain/usecases/subcategory_products_usecase.dart';

part 'subcategory_products_states.dart';

part 'subcategory_products_cubit.freezed.dart';

class SubCategoryProductsCubit extends Cubit<SubCategoryProductsStates> {
  SubCategoryProductsCubit({required this.categoryProductsUseCase})
      : super(const SubCategoryProductsStates.initial());

  static SubCategoryProductsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final SubCategoryProductsUseCase categoryProductsUseCase;

  Future<void> getSubCategoryProducts(
      SubCategoryProductsEntity subcategoryProductsEntity) async {
    emit(const SubCategoryProductsStates.loading());
    final result = await categoryProductsUseCase(subcategoryProductsEntity);

    result.fold(
      (failure) => emit(
        SubCategoryProductsStates.error(failure.code.toString(), failure.message),
      ),
      (subcategoryProducts) => emit(
        SubCategoryProductsStates.success(subcategoryProducts),
      ),
    );
  }
}
