import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/favorite_product_entity.dart';
import '../../domain/use_cases/add_product_to_favorites_use_case.dart';


part 'add_to_favorites_states.dart';
part 'add_to_favorites_cubit.freezed.dart';

class AddToFavoritesCubit extends Cubit<AddToFavoritesStates> {
  AddToFavoritesCubit({required this.addToFavoriteUseCase}) : super(const AddToFavoritesStates.initial());

  static AddToFavoritesCubit get(context) => BlocProvider.of(context);

  final AddProductToFavoritesUseCase addToFavoriteUseCase;

  addFavorite(FavoriteProductEntity favoriteProductEntity) async {
    emit(const AddToFavoritesStates.loading());

    final addProduct = await addToFavoriteUseCase(favoriteProductEntity);

    addProduct.fold(
          (l) => {
        emit(
          AddToFavoritesStates.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          AddToFavoritesStates.success(r),
        ),
      },
    );
  }
}
