part of 'products_by_category_cubit.dart';

@freezed
class ProductsByCategoryStates with _$ProductsByCategoryStates {
  const factory ProductsByCategoryStates.initial() = _Initial;
  const factory ProductsByCategoryStates.loading() = Loading;
  const factory ProductsByCategoryStates.loaded(final List<ProductEntity> products) = Loaded;
  const factory ProductsByCategoryStates.error(final String errCode, final String err) = Error;
}
