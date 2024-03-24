part of 'category_cubit.dart';

@freezed
class CategoryStates with _$CategoryStates {
  const factory CategoryStates.initial() = _Initial;
  const factory CategoryStates.loading() = Loading;
  const factory CategoryStates.success(final List<CategoryEntity> categories) = Success;
  const factory CategoryStates.error(final String errCode, final String err) = Error;
}
