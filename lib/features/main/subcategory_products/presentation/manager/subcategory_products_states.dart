part of 'subcategory_products_cubit.dart';

@freezed
class SubCategoryProductsStates with _$SubCategoryProductsStates {
  const factory SubCategoryProductsStates.initial() = _Initial;
  const factory SubCategoryProductsStates.loading() = Loading;
  const factory SubCategoryProductsStates.success(final SubCategoryProductsEntity categoryProducts) = Success;
  const factory SubCategoryProductsStates.error(final String errCode, final String err) = Error;
}
