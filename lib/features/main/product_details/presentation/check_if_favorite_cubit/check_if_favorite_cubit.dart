import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loveleta/core/helpers/cache_helper.dart';

import '../../domain/entities/favorite_product_entity.dart';
import '../../domain/use_cases/check_if_product_is_favorite_use_case.dart';

part 'check_if_favorite_states.dart';

part 'check_if_favorite_cubit.freezed.dart';

class CheckIfFavoriteCubit extends Cubit<CheckIfFavoriteStates> {
  CheckIfFavoriteCubit({required this.checkIfFavoriteUseCase})
      : super(const CheckIfFavoriteStates.initial());

  static CheckIfFavoriteCubit get(context) => BlocProvider.of(context);

  final CheckIfProductIsFavoriteUseCase checkIfFavoriteUseCase;

  checkFavorite(FavoriteProductEntity favoriteProductEntity) async {
    emit(const CheckIfFavoriteStates.loading());
    final check = await checkIfFavoriteUseCase(favoriteProductEntity);

    check.fold(
      (l) => {
        emit(
          CheckIfFavoriteStates.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
      (r) => {
        emit(
          CheckIfFavoriteStates.success(r),
        ),
      },
    );
  }

  saveToFavorites(bool isFavorite) async {
    await CacheHelper.setData("isFavorite", isFavorite);
  }

  getIfFavorite() async {
    var isFavorite = await CacheHelper.getData("isFavorite");
    return isFavorite;
  }
}
