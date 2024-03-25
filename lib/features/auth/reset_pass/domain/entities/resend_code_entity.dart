import 'package:equatable/equatable.dart';

class ResetResendCodeEntity extends Equatable {
  final num? status;
  final String? message;
  final String? email;

  const ResetResendCodeEntity({
    this.status,
    this.message,
    this.email,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        email,
      ];
}
