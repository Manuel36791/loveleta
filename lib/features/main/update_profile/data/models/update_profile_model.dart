import '../../domain/entities/update_profile_entity.dart';

class UpdateProfileModel extends UpdateProfileEntity{
  const UpdateProfileModel({
    super.userId,
    super.firstName,
    super.lastName,
    super.phone,
    super.pass,
    super.passConf,
    super.status,
    super.message,
  });


  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      status: json["status"] ,
      message: json["message"] ,
    );
  }

  static Map<String, dynamic> updateProfileToJson(UpdateProfileEntity updateEntity) {
    return {
      'user_id': updateEntity.userId,
      'first_name': updateEntity.firstName,
      'last_name': updateEntity.lastName,
      'phone': updateEntity.phone,
      'password': updateEntity.pass,
      'password_confirmation': updateEntity.passConf,
    };
  }

  static Map<String, dynamic> deleteAccountToJson(UpdateProfileEntity deleteEntity) {
    return {
      'user_id': deleteEntity.userId,
    };
  }
}