import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? pass;
  final String? passConf;
  final num? status;
  final String? msg;

  const RegisterEntity({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.pass,
    this.passConf,
    this.status,
    this.msg,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        phone,
        pass,
        passConf,
        status,
        msg,
      ];
}
