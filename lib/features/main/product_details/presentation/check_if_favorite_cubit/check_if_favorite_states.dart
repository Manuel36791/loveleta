part of 'check_if_favorite_cubit.dart';

@freezed
class CheckIfFavoriteStates with _$CheckIfFavoriteStates {
  const factory CheckIfFavoriteStates.initial() = _Initial;
  const factory CheckIfFavoriteStates.loading() = Loading;
  const factory CheckIfFavoriteStates.success(final FavoriteProductEntity favorite) = Success;
  const factory CheckIfFavoriteStates.error(final String errCode, final String err) = Error;
}
