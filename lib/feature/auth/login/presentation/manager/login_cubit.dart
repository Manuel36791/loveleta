import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../generated/l10n.dart';

part 'login_states.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(const LoginStates.initial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  final emailCtrl = BehaviorSubject<String>();
  final passCtrl = BehaviorSubject<String>();

  Stream<String> get emailStream => emailCtrl.stream;

  Stream<String> get passStream => passCtrl.stream;

  validateEmail(String email) {
    if (email.isEmpty) {
      emailCtrl.sink.addError(S.current.emailCantBeEmpty);
    } else if (!email.isEmail()) {
      emailCtrl.sink.addError(S.current.plzEnterAValidEmail);
    } else {
      emailCtrl.sink.add(email);
    }
  }

  validatePass(String pass) async {
    if (pass.isEmpty) {
      passCtrl.sink.addError(S.current.passwordCantBeEmpty);
    } else if (pass.length < 8) {
      passCtrl.sink.addError(S.current.passwordIsTooShort);
    } else {
      passCtrl.sink.add(pass);
    }
  }

  Stream<bool> get loginStream => Rx.combineLatest2(
        emailStream,
        passCtrl,
        (a, b) => true,
      );
}
