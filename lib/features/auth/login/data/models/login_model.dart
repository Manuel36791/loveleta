import '../../../../../core/shared/models/user_data_model.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    super.status,
    super.msg,
    super.error,
    super.userData,
    super.email,
    super.pass,
    super.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json["status"] as num? ?? AppConstants.unknownNumValue,
      error: json["error"] ?? "",
      msg: json["message"] ?? "",
      userData: json["user"] == null ? null : UserData.fromJson(json["user"]),
      token: AppConstants.userToken = json['token'] ?? '',
    );
  }

  static Map<String, dynamic> toJson(LoginEntity loginEntity) {
    return {
      'email': loginEntity.email,
      'password': loginEntity.pass,
    };
  }
}
