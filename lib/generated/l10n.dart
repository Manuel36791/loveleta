// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `success`
  String get success {
    return Intl.message(
      'success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `bad request. try again later`
  String get bad_request_error {
    return Intl.message(
      'bad request. try again later',
      name: 'bad_request_error',
      desc: '',
      args: [],
    );
  }

  /// `success with not content`
  String get no_content {
    return Intl.message(
      'success with not content',
      name: 'no_content',
      desc: '',
      args: [],
    );
  }

  /// `Choose an option to continue`
  String get multiple_choices {
    return Intl.message(
      'Choose an option to continue',
      name: 'multiple_choices',
      desc: '',
      args: [],
    );
  }

  /// `This URL is no longer available`
  String get moved_permanently {
    return Intl.message(
      'This URL is no longer available',
      name: 'moved_permanently',
      desc: '',
      args: [],
    );
  }

  /// `forbidden request. try again later`
  String get forbidden_error {
    return Intl.message(
      'forbidden request. try again later',
      name: 'forbidden_error',
      desc: '',
      args: [],
    );
  }

  /// `user unauthorized, try again later`
  String get unauthorized_error {
    return Intl.message(
      'user unauthorized, try again later',
      name: 'unauthorized_error',
      desc: '',
      args: [],
    );
  }

  /// `Payment Required`
  String get payment_required {
    return Intl.message(
      'Payment Required',
      name: 'payment_required',
      desc: '',
      args: [],
    );
  }

  /// `unprocessable data, check it and try again`
  String get unprocessable_content_error {
    return Intl.message(
      'unprocessable data, check it and try again',
      name: 'unprocessable_content_error',
      desc: '',
      args: [],
    );
  }

  /// `Invalid data, please try again`
  String get bad_gateway {
    return Intl.message(
      'Invalid data, please try again',
      name: 'bad_gateway',
      desc: '',
      args: [],
    );
  }

  /// `Server is under maintenance`
  String get service_unavailable {
    return Intl.message(
      'Server is under maintenance',
      name: 'service_unavailable',
      desc: '',
      args: [],
    );
  }

  /// `url not found, try again later`
  String get not_found_error {
    return Intl.message(
      'url not found, try again later',
      name: 'not_found_error',
      desc: '',
      args: [],
    );
  }

  /// `conflict found, try again later`
  String get conflict_error {
    return Intl.message(
      'conflict found, try again later',
      name: 'conflict_error',
      desc: '',
      args: [],
    );
  }

  /// `some thing went wrong, try again later`
  String get internal_server_error {
    return Intl.message(
      'some thing went wrong, try again later',
      name: 'internal_server_error',
      desc: '',
      args: [],
    );
  }

  /// `some thing went wrong, try again later`
  String get unknown_error {
    return Intl.message(
      'some thing went wrong, try again later',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `time out, try again late`
  String get timeout_error {
    return Intl.message(
      'time out, try again late',
      name: 'timeout_error',
      desc: '',
      args: [],
    );
  }

  /// `some thing went wrong, try again later`
  String get default_error {
    return Intl.message(
      'some thing went wrong, try again later',
      name: 'default_error',
      desc: '',
      args: [],
    );
  }

  /// `cache error, try again later`
  String get cache_error {
    return Intl.message(
      'cache error, try again later',
      name: 'cache_error',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get no_internet_error {
    return Intl.message(
      'Please check your internet connection',
      name: 'no_internet_error',
      desc: '',
      args: [],
    );
  }

  /// `Unsupported, please try Again later`
  String get method_not_allowed_error {
    return Intl.message(
      'Unsupported, please try Again later',
      name: 'method_not_allowed_error',
      desc: '',
      args: [],
    );
  }

  /// `Error: {errCode}, {err}`
  String error(String errCode, String err) {
    return Intl.message(
      'Error: $errCode, $err',
      name: 'error',
      desc: '',
      args: [errCode, err],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message(
      'Remember Me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don’t Have An account`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don’t Have An account',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Email can't be empty`
  String get emailCantBeEmpty {
    return Intl.message(
      'Email can\'t be empty',
      name: 'emailCantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get plzEnterAValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'plzEnterAValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password can't be empty`
  String get passwordCantBeEmpty {
    return Intl.message(
      'Password can\'t be empty',
      name: 'passwordCantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get passwordIsTooShort {
    return Intl.message(
      'Password is too short',
      name: 'passwordIsTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Logged In Successfully, welcome again {userName}`
  String loggedInSuccessful(String userName) {
    return Intl.message(
      'Logged In Successfully, welcome again $userName',
      name: 'loggedInSuccessful',
      desc: '',
      args: [userName],
    );
  }

  /// `Your account is not yet activated. Please check your email for the activation code or try again later.`
  String get accountNotActivated {
    return Intl.message(
      'Your account is not yet activated. Please check your email for the activation code or try again later.',
      name: 'accountNotActivated',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password. Please check your credentials and try again.`
  String get invalidCredentials {
    return Intl.message(
      'Invalid email or password. Please check your credentials and try again.',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password Confirmation`
  String get passwordConfirmation {
    return Intl.message(
      'Password Confirmation',
      name: 'passwordConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name`
  String get pleaseEnterYourFirstName {
    return Intl.message(
      'Please enter your first name',
      name: 'pleaseEnterYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get pleaseEnterYourLastName {
    return Intl.message(
      'Please enter your last name',
      name: 'pleaseEnterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get pleaseEnterYourPhoneNumber {
    return Intl.message(
      'Please enter your phone number',
      name: 'pleaseEnterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get pleaseEnterAValidPhoneNumber {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'pleaseEnterAValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address`
  String get pleaseEnterYourEmailAddress {
    return Intl.message(
      'Please enter your email address',
      name: 'pleaseEnterYourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get pleaseEnterAValidEmailAddress {
    return Intl.message(
      'Please enter a valid email address',
      name: 'pleaseEnterAValidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password`
  String get pleaseEnterAPassword {
    return Intl.message(
      'Please enter a password',
      name: 'pleaseEnterAPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password with at least 8 characters`
  String get pleaseEnterAPasswordWithAtLeast8Characters {
    return Intl.message(
      'Please enter a password with at least 8 characters',
      name: 'pleaseEnterAPasswordWithAtLeast8Characters',
      desc: '',
      args: [],
    );
  }

  /// `Please reconfirm your password`
  String get pleaseReconfirmYourPassword {
    return Intl.message(
      'Please reconfirm your password',
      name: 'pleaseReconfirmYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match. Please try again`
  String get passwordsDoNotMatchPleaseTryAgain {
    return Intl.message(
      'Passwords do not match. Please try again',
      name: 'passwordsDoNotMatchPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Verify Account`
  String get verifyAccount {
    return Intl.message(
      'Verify Account',
      name: 'verifyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Send Again`
  String get sendAgain {
    return Intl.message(
      'Send Again',
      name: 'sendAgain',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the activation code sent to your email`
  String get pleaseEnterTheActivationCodeSentToYourEmail {
    return Intl.message(
      'Please enter the activation code sent to your email',
      name: 'pleaseEnterTheActivationCodeSentToYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Code can't be less than 4 characters`
  String get codeCantBeLessThan4Characters {
    return Intl.message(
      'Code can\'t be less than 4 characters',
      name: 'codeCantBeLessThan4Characters',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Pass`
  String get resetPasswordBtn {
    return Intl.message(
      'Reset Pass',
      name: 'resetPasswordBtn',
      desc: '',
      args: [],
    );
  }

  /// `Please enter verification code sent to your email`
  String get pleaseEnterVerificationCodeSentToYourEmail {
    return Intl.message(
      'Please enter verification code sent to your email',
      name: 'pleaseEnterVerificationCodeSentToYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `New password can't be less than 8 characters`
  String get newPasswordCantBeLessThan8Characters {
    return Intl.message(
      'New password can\'t be less than 8 characters',
      name: 'newPasswordCantBeLessThan8Characters',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get updatePassword {
    return Intl.message(
      'Update Password',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Email: {email} Registered Successfully`
  String emailRegisteredSuccessful(String email) {
    return Intl.message(
      'Email: $email Registered Successfully',
      name: 'emailRegisteredSuccessful',
      desc: '',
      args: [email],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
