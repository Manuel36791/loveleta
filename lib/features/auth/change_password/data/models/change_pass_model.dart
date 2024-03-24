import '../../domain/entities/change_pass_entity.dart';

class ChangePassModel extends ChangePassEntity {
  const ChangePassModel({
    super.status,
    super.msg,
    super.email,
    super.pass,
    super.passConf,
  });

  factory ChangePassModel.fromJson(Map<String, dynamic> json) {
    return ChangePassModel(
      status: json['status'],
      msg: json['message'],
    );
  }

  static Map<String, dynamic> toJson(ChangePassEntity changePassEntity) {
    return {
      'email': changePassEntity.email,
      'password': changePassEntity.pass,
      'password_confirmation': changePassEntity.passConf,
    };
  }
}
