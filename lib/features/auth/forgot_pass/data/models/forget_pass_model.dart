import '../../domain/entities/forget_pass_entity.dart';

class ForgetPassModel extends ForgetPassEntity {
  const ForgetPassModel({
    super.status,
    super.msg,
    super.email,
  });

  factory ForgetPassModel.fromJson(Map<String, dynamic> json) {
    return ForgetPassModel(
      status: json['status'],
      msg: json['message'],
    );
  }

  static Map<String, dynamic> toJson(ForgetPassEntity forgetPassEntity) {
    return {
      'email': forgetPassEntity.email,
    };
  }
}
