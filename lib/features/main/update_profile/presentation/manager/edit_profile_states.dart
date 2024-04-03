part of 'edit_profile_cubit.dart';

@freezed
class EditProfileStates with _$EditProfileStates {
  const factory EditProfileStates.initial() = _Initial;
  const factory EditProfileStates.loading() = Loading;
  const factory EditProfileStates.success(final UpdateProfileEntity? editProfileEntity) = Success;
  const factory EditProfileStates.deleteSuccess(final UpdateProfileEntity? editProfileEntity) = DeleteSuccess;
  const factory EditProfileStates.error(final String? errCode, final String? err) = Error;
}
