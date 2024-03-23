import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../generated/l10n.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/use_cases/register_usecase.dart';

part 'register_states.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit({required this.registerUseCase}) : super(const RegisterStates.initial());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  final firstNameCtrl = BehaviorSubject<String>();
  final lastNameCtrl = BehaviorSubject<String>();
  final emailCtrl = BehaviorSubject<String>();
  final phoneCtrl = BehaviorSubject<String>();
  final passCtrl = BehaviorSubject<String>();
  final passConfCtrl = BehaviorSubject<String>();

  Stream<String> get firstNameStream => firstNameCtrl.stream;
  Stream<String> get lastNameStream => lastNameCtrl.stream;
  Stream<String> get emailStream => emailCtrl.stream;
  Stream<String> get phoneStream => phoneCtrl.stream;
  Stream<String> get passStream => passCtrl.stream;
  Stream<String> get passConfStream => passConfCtrl.stream;

  validateFirstName(String firstName) async {
    if (firstName.isEmpty) {
      firstNameCtrl.sink.addError(S.current.pleaseEnterYourFirstName);
    } else {
      firstNameCtrl.sink.add(firstName);
    }
  }

  validateLastName(String lastName) async {
    if (lastName.isEmpty) {
      lastNameCtrl.sink.addError(S.current.pleaseEnterYourLastName);
    } else {
      lastNameCtrl.sink.add(lastName);
    }
  }

  String countryCode = "";

  validatePhone(String phone) async {
    if (phone.isEmpty) {
      phoneCtrl.sink.addError(S.current.pleaseEnterYourPhoneNumber);
    } else if (!phone.isPhone()) {
      phoneCtrl.sink.addError(S.current.pleaseEnterAValidPhoneNumber);
    } else {
      phoneCtrl.sink.add(countryCode + phone);
    }
  }
  validateEmail(String email) async {
    if (email.isEmpty) {
      emailCtrl.sink.addError(S.current.pleaseEnterYourEmailAddress);
    } else if (!email.isEmail()) {
      emailCtrl.sink.addError(S.current.pleaseEnterAValidEmailAddress);
    } else {
      emailCtrl.sink.add(email);
    }
  }

  validatePass(String pass) async {
    if (pass.isEmpty) {
      passCtrl.sink.addError(S.current.pleaseEnterAPassword);
    } else if (pass.length < 8) {
      passCtrl.sink.addError(S.current.pleaseEnterAPasswordWithAtLeast8Characters);
    } else {
      passCtrl.sink.add(pass);
    }
  }

  validatePassConfirm(String passConfirm) async {
    if (passConfirm.isEmpty) {
      passConfCtrl.sink.addError(S.current.pleaseReconfirmYourPassword);
    } else if (passConfirm != passCtrl.value) {
      passConfCtrl.sink.addError(S.current.passwordsDoNotMatchPleaseTryAgain);
    } else {
      passConfCtrl.sink.add(passConfirm);
    }
  }

  Stream<bool> get registerBtnStream => Rx.combineLatest6(
    firstNameStream,
    lastNameStream,
    emailStream,
    phoneStream,
    passStream,
    passConfStream,
        (a, b, c, d, e, f) => true,
  );

  final RegisterUseCase registerUseCase;
  // final CheckRegisteredEmailUseCase checkRegisteredEmailUseCase;

  userRegister(RegisterEntity registerEntity) async {
    emit(const RegisterStates.loading());
    final register = await registerUseCase(registerEntity);

    register.fold(
          (l) {
        emit(
          RegisterStates.error(
            l.code.toString(),
            l.message,
          ),
        );
      },
          (r) {
        emit(
          RegisterStates.success(registerEntity),
        );
      },
    );
  }
}
