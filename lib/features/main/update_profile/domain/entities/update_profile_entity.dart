import 'package:equatable/equatable.dart';

class UpdateProfileEntity extends Equatable {
  final num? userId;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? pass;
  final String? passConf;
  final int? status;
  final String? message;

  const UpdateProfileEntity({
    this.userId,
    this.firstName,
    this.lastName,
    this.phone,
    this.pass,
    this.passConf,
    this.status,
    this.message,
  });

  @override
  List<Object?> get props => [
        userId,
        firstName,
        lastName,
        phone,
        pass,
        passConf,
        status,
        message,
      ];
}
