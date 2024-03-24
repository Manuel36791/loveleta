import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../generated/l10n.dart';
import '../../domain/entities/forget_pass_entity.dart';
import '../../domain/use_cases/forget_pass_usecase.dart';

part 'forgot_pass_states.dart';

part 'forgot_pass_cubit.freezed.dart';

class ForgotPassCubit extends Cubit<ForgotPassStates> {
  ForgotPassCubit({required this.forgotPassUseCase}) : super(const ForgotPassStates.initial());

  static ForgotPassCubit get(BuildContext context) => BlocProvider.of(context);

  final emailCtrl = BehaviorSubject<String>();

  Stream<String> get emailStream => emailCtrl.stream;

  validateEmail(String email) async {
    if (email.isEmpty) {
      emailCtrl.sink.addError(S.current.emailCantBeEmpty);
    } else if (!email.isEmail()) {
      emailCtrl.sink.addError(S.current.plzEnterAValidEmail);
    } else {
      emailCtrl.sink.add(email);
    }
  }

  Stream<bool> get submitValid => Rx.combineLatest(
        [emailStream],
        (values) => true,
      );

  final ForgotPassUseCase forgotPassUseCase;

  userForgotPass(ForgetPassEntity forgetPassEntity) async {
    emit(const ForgotPassStates.loading());
    final forgotPass = await forgotPassUseCase(forgetPassEntity);

    forgotPass.fold(
          (l) {
        emit(
          ForgotPassStates.error(
            l.code.toString(),
            l.message,
          ),
        );
      },
          (r) => {
        emit(
          ForgotPassStates.success(r),
        )
      },
    );
  }
}
