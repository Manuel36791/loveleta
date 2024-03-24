import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/usecases/category_use_case.dart';

part 'category_states.dart';

part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit({required this.categoryUseCase})
      : super(const CategoryStates.initial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  final CategoryUseCase categoryUseCase;

  getCategories() async {
    emit(const CategoryStates.loading());
    final result = await categoryUseCase();
    result.fold(
      (failure) => emit(
        CategoryStates.error(
          failure.code.toString(),
          failure.message,
        ),
      ),
      (categories) => emit(
        CategoryStates.success(categories),
      ),
    );
  }
}
