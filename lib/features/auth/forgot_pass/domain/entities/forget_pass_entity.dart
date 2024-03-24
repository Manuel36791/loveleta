import 'package:equatable/equatable.dart';

class ForgetPassEntity extends Equatable {
  final num? status;
  final String? msg;
  final String? email;

  const ForgetPassEntity({
    this.status,
    this.msg,
    this.email,
  });

  @override
  List<Object?> get props => [
    status,
    msg,
    email,
  ];
}
