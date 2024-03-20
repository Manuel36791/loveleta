import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../generated/l10n.dart';

part 'change_pass_states.dart';
part 'change_pass_cubit.freezed.dart';

class ChangePassCubit extends Cubit<ChangePassStates> {
  ChangePassCubit() : super(const ChangePassStates.initial());

  static ChangePassCubit get(BuildContext context) => BlocProvider.of(context);

  var newPassCtrl = BehaviorSubject<String>();
  var newPassConfirmCtrl = BehaviorSubject<String>();

  Stream<String> get newPassStream => newPassCtrl.stream;

  Stream<String> get newPassConfStream => newPassConfirmCtrl.stream;

  validateNewPass(String pass) async {
    if (pass.isEmpty) {
      newPassCtrl.sink.addError(S.current.passwordCantBeEmpty);
    } else if (pass.length < 8) {
      newPassCtrl.sink.addError(S.current.newPasswordCantBeLessThan8Characters);
    } else {
      newPassCtrl.sink.add(pass);
    }
  }

  validateNewPassConf(String passConfirm) async {
    if (passConfirm.isEmpty) {
      newPassConfirmCtrl.sink.addError(S.current.pleaseReconfirmYourPassword);
    } else if (passConfirm != newPassCtrl.value) {
      newPassConfirmCtrl.sink.addError(S.current.passwordsDoNotMatchPleaseTryAgain);
    } else {
      newPassConfirmCtrl.sink.add(passConfirm);
    }
  }

  Stream<bool> get validateChangePassBtnStream => Rx.combineLatest(
    [
      newPassStream,
      newPassConfStream,
    ],
        (values) => true,
  );
}
