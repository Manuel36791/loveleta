import 'package:equatable/equatable.dart';

class ChangePassEntity extends Equatable {
  final int? status;
  final String? msg;
  final String? email;
  final String? pass;
  final String? passConf;

  const ChangePassEntity({
    this.status,
    this.msg,
    this.email,
    this.pass,
    this.passConf,
  });

  @override
  List<Object?> get props => [
    status,
    msg,
    email,
    pass,
    passConf,
  ];
}
