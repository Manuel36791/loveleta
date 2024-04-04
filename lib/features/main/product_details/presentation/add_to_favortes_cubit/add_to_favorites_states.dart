part of 'add_to_favorites_cubit.dart';

@freezed
class AddToFavoritesStates with _$AddToFavoritesStates {
  const factory AddToFavoritesStates.initial() = _Initial;
  const factory AddToFavoritesStates.loading() = Loading;
  const factory AddToFavoritesStates.success(final FavoriteProductEntity favorite) = Success;
  const factory AddToFavoritesStates.error(final String errCode, final String err) = Error;
}
