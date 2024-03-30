import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loveleta/features/main/home/domain/usecases/products_by_category_use_case.dart';

import '../../../../../../core/shared/entities/product_entity.dart';
import '../../../../categories/domain/entities/category_entity.dart';

part 'products_by_category_states.dart';
part 'products_by_category_cubit.freezed.dart';

class ProductsByCategoryCubit extends Cubit<ProductsByCategoryStates> {
  ProductsByCategoryCubit({required this.productsUseCase}) : super(const ProductsByCategoryStates.initial());

  static ProductsByCategoryCubit get(context) => BlocProvider.of(context);

  final ProductsByCategoryUseCase productsUseCase;

  getProductsByCategory(CategoryEntity categoryEntity) async {
    emit(const ProductsByCategoryStates.loading());
    final product = await productsUseCase(categoryEntity);

    product.fold(
      (failure) => emit(ProductsByCategoryStates.error(failure.code.toString(), failure.message,)),
      (products) => emit(ProductsByCategoryStates.loaded(products)),
    );
  }
}
