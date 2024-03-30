import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/shared/entities/product_entity.dart';
import '../../../domain/usecases/new_products_use_case.dart';

part 'new_products_states.dart';

part 'new_products_cubit.freezed.dart';

class NewProductsCubit extends Cubit<NewProductsStates> {
  NewProductsCubit({required this.newProductsUseCase}) : super(const NewProductsStates.initial());

  static NewProductsCubit get(context) => BlocProvider.of(context);

  final NewProductsUseCase newProductsUseCase;

  getNewProducts(int nextPage) async {
    emit(const NewProductsStates.loading());
    final result = await newProductsUseCase.call(nextPage);

    result.fold((failure) {
      emit(
        NewProductsStates.error(
          failure.code.toString(),
          failure.message,
        ),
      );
    }, (products) {
      emit(NewProductsStates.success(products));
    });
  }
}
