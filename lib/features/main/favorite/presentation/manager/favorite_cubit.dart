import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/favorite_entity.dart';
import '../../domain/use_cases/favorite_use_case.dart';

part 'favorite_states.dart';

part 'favorite_cubit.freezed.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit({required this.favoriteUseCase})
      : super(const FavoriteStates.initial());

  static FavoriteCubit get(context) => BlocProvider.of(context);

  final FavoriteUseCase favoriteUseCase;

  getAllFavorites(FavoriteEntity favoriteEntity) async {
    if (favoriteEntity.page == 1) {
      emit(const FavoriteStates.loading());
    } else {
      emit(const FavoriteStates.paginationLoading());
    }

    final getAllProduct = await favoriteUseCase(favoriteEntity);

    getAllProduct.fold(
      (l) => {
        if (favoriteEntity.page == 1)
          {
            emit(
              FavoriteStates.error(
                l.code.toString(),
                l.message,
              ),
            ),
          }
        else
          {
            emit(
              FavoriteStates.paginationError(
                l.code.toString(),
                l.message,
              ),
            ),
          }
      },
      (r) => {
        emit(
          FavoriteStates.success(r),
        ),
      },
    );
  }
}
