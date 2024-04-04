part of 'favorite_cubit.dart';

@freezed
class FavoriteStates with _$FavoriteStates {
  const factory FavoriteStates.initial() = _Initial;
  const factory FavoriteStates.loading() = Loading;
  const factory FavoriteStates.success(final FavoriteEntity favoriteEntity) = Success;
  const factory FavoriteStates.error(final String? errCode, final String? err) = Error;
  const factory FavoriteStates.paginationLoading() = PaginationLoading;
  const factory FavoriteStates.paginationError(final String? errCode, final String? err) = PaginationSuccess;
}
