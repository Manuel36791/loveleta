import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../generated/l10n.dart';
import '../../domain/entities/change_pass_entity.dart';
import '../../domain/use_cases/change_pass_usecase.dart';

part 'change_pass_states.dart';
part 'change_pass_cubit.freezed.dart';

class ChangePassCubit extends Cubit<ChangePassStates> {
  ChangePassCubit({required this.changePassUseCase}) : super(const ChangePassStates.initial());

  static ChangePassCubit get(BuildContext context) => BlocProvider.of(context);

  var newPassCtrl = BehaviorSubject<String>();
  var newPassConfCtrl = BehaviorSubject<String>();

  Stream<String> get newPassStream => newPassCtrl.stream;

  Stream<String> get newPassConfStream => newPassConfCtrl.stream;

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
      newPassConfCtrl.sink.addError(S.current.pleaseReconfirmYourPassword);
    } else if (passConfirm != newPassCtrl.value) {
      newPassConfCtrl.sink.addError(S.current.passwordsDoNotMatchPleaseTryAgain);
    } else {
      newPassConfCtrl.sink.add(passConfirm);
    }
  }

  Stream<bool> get validateChangePassBtnStream => Rx.combineLatest(
    [
      newPassStream,
      newPassConfStream,
    ],
        (values) => true,
  );

  final ChangePassUseCase changePassUseCase;

  userChangePass(ChangePassEntity changePassEntity) async {
    emit(const ChangePassStates.loading());

    final changePass = await changePassUseCase(changePassEntity);

    changePass.fold(
          (l) => {
        emit(
          ChangePassStates.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          ChangePassStates.success(r),
        ),
      },
    );
  }

}
