part of 'best_seller_cubit.dart';

@freezed
class BestSellerStates with _$BestSellerStates {
  const factory BestSellerStates.initial() = _Initial;
  const factory BestSellerStates.loading() = Loading;
  const factory BestSellerStates.success(final List<ProductEntity> products) = Success;
  const factory BestSellerStates.error(final String errCode, final String err) = Error;
  const factory BestSellerStates.paginationLoading() = PaginationLoading;
  const factory BestSellerStates.paginationError(final String errCode, final String err) = PaginationError;
}
