part of 'register_cubit.dart';

@freezed
class RegisterStates with _$RegisterStates {
  const factory RegisterStates.initial() = _Initial;
  const factory RegisterStates.loading() = Loading;
  const factory RegisterStates.success(final RegisterEntity registeredUser) = Success;
  const factory RegisterStates.error(final String errCode, final String err) = Error;
}
