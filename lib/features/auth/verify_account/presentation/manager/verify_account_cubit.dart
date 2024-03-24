import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loveleta/features/auth/verify_account/domain/entities/resend_code_entity.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../generated/l10n.dart';
import '../../domain/entities/verify_account_entity.dart';
import '../../domain/use_cases/resend_code_usecase.dart';
import '../../domain/use_cases/verify_account_usecase.dart';

part 'verify_account_states.dart';

part 'verify_account_cubit.freezed.dart';

class VerifyAccountCubit extends Cubit<VerifyAccountStates> {
  VerifyAccountCubit({required this.verifyAccountUseCase, required this.resendCodeUseCase}) : super(const VerifyAccountStates.initial());

  static VerifyAccountCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final pinCtrl = BehaviorSubject<String>();

  Stream<String> get pinStream => pinCtrl.stream;

  validateCode(String code) {
    if (code.isEmpty) {
      pinCtrl.sink
          .addError(S.current.pleaseEnterTheActivationCodeSentToYourEmail);
    } else if (code.length < 4) {
      pinCtrl.sink.addError(S.current.codeCantBeLessThan6Characters);
    } else {
      pinCtrl.sink.add(code);
    }
  }

  Stream<bool> get verifyBtnStream => Rx.combineLatest(
        [pinStream],
        (values) => true,
      );

  final VerifyAccountUseCase verifyAccountUseCase;

  verifyUserAccount(VerifyAccountEntity verifyAccountEntity) async {
    emit(const VerifyAccountStates.loading());
    final verify = await verifyAccountUseCase(verifyAccountEntity);

    verify.fold((l) {
      emit(
        VerifyAccountStates.error(
          l.code.toString(),
          l.message,
        ),
      );
    }, (r) {
      emit(
        VerifyAccountStates.success(r),
      );
    });
  }

  final VerifyResendCodeUseCase resendCodeUseCase;

  resendCode(ResendCodeEntity resendCodeEntity) async {
    emit(const VerifyAccountStates.loading());
    final resentOtp = await resendCodeUseCase(resendCodeEntity);

    resentOtp.fold(
          (l) => {
        emit(
          VerifyAccountStates.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          VerifyAccountStates.resendCode(r),
        ),
      },
    );
  }
}
