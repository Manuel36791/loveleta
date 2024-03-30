part of 'new_products_cubit.dart';

@freezed
class NewProductsStates with _$NewProductsStates {
  const factory NewProductsStates.initial() = _Initial;
  const factory NewProductsStates.loading() = Loading;
  const factory NewProductsStates.success(final List<ProductEntity> products) = Success;
  const factory NewProductsStates.error(final String errCode, final String err) = Error;
  const factory NewProductsStates.paginationLoading(final List<ProductEntity> products) = PaginationLoading;
  const factory NewProductsStates.paginationError(final String errCode, final String err) = PaginationError;
}
