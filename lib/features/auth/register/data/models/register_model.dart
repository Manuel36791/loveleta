import '../../domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    super.firstName,
    super.lastName,
    super.email,
    super.phone,
    super.pass,
    super.passConf,
    super.status,
    super.msg,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'],
      msg: json['message'],
      email: json["email"] ?? json["user"]["email"],
    );
  }

  static Map<String, dynamic> toJson(RegisterEntity registerEntity) {
    return {
      'first_name': registerEntity.firstName,
      'last_name': registerEntity.lastName,
      'email': registerEntity.email,
      'phone': registerEntity.phone,
      'password': registerEntity.pass,
      'password_confirmation': registerEntity.passConf,
    };
  }
}
