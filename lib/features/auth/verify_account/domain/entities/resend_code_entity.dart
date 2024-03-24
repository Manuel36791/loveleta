import 'package:equatable/equatable.dart';

class ResendCodeEntity extends Equatable {
  final num? status;
  final String? message;
  final String? email;

  const ResendCodeEntity({
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
