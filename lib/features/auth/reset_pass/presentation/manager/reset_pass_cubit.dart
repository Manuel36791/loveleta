import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loveleta/features/auth/reset_pass/domain/entities/resend_code_entity.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../generated/l10n.dart';
import '../../domain/entities/reset_entity.dart';
import '../../domain/use_cases/resend_code_usecase.dart';
import '../../domain/use_cases/reset_pass_usecase.dart';

part 'reset_pass_states.dart';
part 'reset_pass_cubit.freezed.dart';

class ResetPassCubit extends Cubit<ResetPassStates> {
  ResetPassCubit({required this.resetPassUseCase, required this.resendCodeUseCase}) : super(const ResetPassStates.initial());
  
  static ResetPassCubit get(BuildContext context) => BlocProvider.of(context);
  
  final pinCtrl = BehaviorSubject<String>();

  Stream<String> get pinStream => pinCtrl.stream;

  validateCode(String code) {
    if (code.isEmpty) {
      pinCtrl.sink
          .addError(S.current.pleaseEnterVerificationCodeSentToYourEmail, StackTrace.current);
    } else if (code.length != 6) {
      pinCtrl.sink.addError(S.current.codeCantBeLessThan6Characters);
    } else {
      pinCtrl.sink.add(code);
    }
  }

  Stream<bool> get verifyBtnStream => Rx.combineLatest(
    [pinStream],
        (values) => true,
  );

  final ResetPassUseCase resetPassUseCase;

  resetUserPassword(ResetPassEntity resetPassEntity) async {
    emit(const ResetPassStates.loading());
    final verify = await resetPassUseCase(resetPassEntity);

    verify.fold((l) {
      emit(
        ResetPassStates.error(
          l.code.toString(),
          l.message,
        ),
      );
    }, (r) {
      emit(
        ResetPassStates.success(r),
      );
    });
  }

  final ResendCodeUseCase resendCodeUseCase;

  resendCode(ResetResendCodeEntity resendCodeEntity) async {
    emit(const ResetPassStates.loading());
    final resentOtp = await resendCodeUseCase(resendCodeEntity);

    resentOtp.fold(
          (l) => {
        emit(
          ResetPassStates.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          ResetPassStates.resendCode(r),
        ),
      },
    );
  }
}
