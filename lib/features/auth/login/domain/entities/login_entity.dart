import 'package:equatable/equatable.dart';

import '../../../../../core/shared/models/user_data_model.dart';

class LoginEntity extends Equatable {

  final num? status;
  final String? msg;
  final String? email;
  final String? pass;
  final UserData? userData;
  final String? token;


  const LoginEntity( {
    this.email,
    this.pass,
    this.status,
    this.msg,
    this.userData,
    this.token,
  });

  @override
  List<Object?> get props => [
        status,
        msg,
        userData,
      ];
}
