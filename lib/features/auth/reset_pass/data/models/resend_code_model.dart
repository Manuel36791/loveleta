
import '../../domain/entities/resend_code_entity.dart';

class ResendCodeModel extends ResetResendCodeEntity {
  const ResendCodeModel({
    super.status,
    super.message,
    super.email,
  });

  factory ResendCodeModel.fromJson(Map<String, dynamic> json) {
    return ResendCodeModel(
      status: json['status'],
      message: json['message'],
    );
  }

  static Map<String, dynamic> toJson(ResetResendCodeEntity resendCodeEntity) {
    return {
      "email": resendCodeEntity.email,
    };
  }
}