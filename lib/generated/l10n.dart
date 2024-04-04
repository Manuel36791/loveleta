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

  /// `Logged In Successfully. Welcome again {userName}`
  String loggedInSuccessful(String userName) {
    return Intl.message(
      'Logged In Successfully. Welcome again $userName',
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

  /// `Email: {email} Registered Successfully`
  String emailRegisteredSuccessful(String email) {
    return Intl.message(
      'Email: $email Registered Successfully',
      name: 'emailRegisteredSuccessful',
      desc: '',
      args: [email],
    );
  }

  /// `This email address is already registered. Please use a different email address or log in with your existing account.`
  String get emailAlreadyExist {
    return Intl.message(
      'This email address is already registered. Please use a different email address or log in with your existing account.',
      name: 'emailAlreadyExist',
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

  /// `Code can't be less than 6 characters`
  String get codeCantBeLessThan6Characters {
    return Intl.message(
      'Code can\'t be less than 6 characters',
      name: 'codeCantBeLessThan6Characters',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been successfully activated. You can now log in and access your account.`
  String get activationSuccess {
    return Intl.message(
      'Your account has been successfully activated. You can now log in and access your account.',
      name: 'activationSuccess',
      desc: '',
      args: [],
    );
  }

  /// `The OTP entered is incorrect. Please check your email again and enter the correct OTP to verify your account.`
  String get wrongVerifyOtp {
    return Intl.message(
      'The OTP entered is incorrect. Please check your email again and enter the correct OTP to verify your account.',
      name: 'wrongVerifyOtp',
      desc: '',
      args: [],
    );
  }

  /// `An OTP has been resent to your email. Please check your inbox and enter the new OTP to continue.`
  String get newOtpSent {
    return Intl.message(
      'An OTP has been resent to your email. Please check your inbox and enter the new OTP to continue.',
      name: 'newOtpSent',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address, Please check your email and try again.`
  String get invalidEmailAddress {
    return Intl.message(
      'Invalid email address, Please check your email and try again.',
      name: 'invalidEmailAddress',
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

  /// `The email address provided is not registered. Please ensure you have entered the correct email or proceed with creating a new account`
  String get emailNotRegistered {
    return Intl.message(
      'The email address provided is not registered. Please ensure you have entered the correct email or proceed with creating a new account',
      name: 'emailNotRegistered',
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

  /// `The OTP entered is incorrect. Please check your email again and enter the correct OTP to reset your password`
  String get wrongOtpEntered {
    return Intl.message(
      'The OTP entered is incorrect. Please check your email again and enter the correct OTP to reset your password',
      name: 'wrongOtpEntered',
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

  /// `Your password has been successfully changed. You can now log in with your new password.`
  String get passwordChangedSuccessful {
    return Intl.message(
      'Your password has been successfully changed. You can now log in with your new password.',
      name: 'passwordChangedSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Search For gifts, flowers Cakes...`
  String get search {
    return Intl.message(
      'Search For gifts, flowers Cakes...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `New Arrivals`
  String get newArrivals {
    return Intl.message(
      'New Arrivals',
      name: 'newArrivals',
      desc: '',
      args: [],
    );
  }

  /// `Best Sellers`
  String get bestSellers {
    return Intl.message(
      'Best Sellers',
      name: 'bestSellers',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get updateProfile {
    return Intl.message(
      'Update Profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Our privacy policy describes how we collect and process your personal information, such as the information you provide through our application. The policy also outlines your rights regarding your personal information, how it is retained, and secured. Communication: Various communication channels are provided in case of any questions or inquiries about the privacy policy. You can speak to the team through the application, call the specified number, or contact them via email.Updates: In the event of any changes in the way personal information is processed or in the policy itself, you will be promptly notified via email and the application will be updated.`
  String get privacyDes {
    return Intl.message(
      'Our privacy policy describes how we collect and process your personal information, such as the information you provide through our application. The policy also outlines your rights regarding your personal information, how it is retained, and secured. Communication: Various communication channels are provided in case of any questions or inquiries about the privacy policy. You can speak to the team through the application, call the specified number, or contact them via email.Updates: In the event of any changes in the way personal information is processed or in the policy itself, you will be promptly notified via email and the application will be updated.',
      name: 'privacyDes',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Saved addresses`
  String get savedAddresses {
    return Intl.message(
      'Saved addresses',
      name: 'savedAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Bag`
  String get bag {
    return Intl.message(
      'Bag',
      name: 'bag',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Loveleta Express`
  String get loveletaExpress {
    return Intl.message(
      'Loveleta Express',
      name: 'loveletaExpress',
      desc: '',
      args: [],
    );
  }

  /// `Free Delivery`
  String get freeDelivery {
    return Intl.message(
      'Free Delivery',
      name: 'freeDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Gift Details`
  String get giftDetails {
    return Intl.message(
      'Gift Details',
      name: 'giftDetails',
      desc: '',
      args: [],
    );
  }

  /// `Availability: {availability}`
  String availability(String availability) {
    return Intl.message(
      'Availability: $availability',
      name: 'availability',
      desc: '',
      args: [availability],
    );
  }

  /// `In Stock`
  String get inStock {
    return Intl.message(
      'In Stock',
      name: 'inStock',
      desc: '',
      args: [],
    );
  }

  /// `Out of Stock`
  String get outOfStock {
    return Intl.message(
      'Out of Stock',
      name: 'outOfStock',
      desc: '',
      args: [],
    );
  }

  /// `SKU: {SKU}`
  String sku(String SKU) {
    return Intl.message(
      'SKU: $SKU',
      name: 'sku',
      desc: '',
      args: [SKU],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `SAR {price}`
  String sar(String price) {
    return Intl.message(
      'SAR $price',
      name: 'sar',
      desc: '',
      args: [price],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message(
      'Add to cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get processing {
    return Intl.message(
      'Processing',
      name: 'processing',
      desc: '',
      args: [],
    );
  }

  /// `Shipped`
  String get shipped {
    return Intl.message(
      'Shipped',
      name: 'shipped',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `You Have no orders yet`
  String get youHaveNoOrdersYet {
    return Intl.message(
      'You Have no orders yet',
      name: 'youHaveNoOrdersYet',
      desc: '',
      args: [],
    );
  }

  /// `Order Number #{orderNo}`
  String orderNumber(String orderNo) {
    return Intl.message(
      'Order Number #$orderNo',
      name: 'orderNumber',
      desc: '',
      args: [orderNo],
    );
  }

  /// `QTY: {quantity}`
  String qty(Object quantity) {
    return Intl.message(
      'QTY: $quantity',
      name: 'qty',
      desc: '',
      args: [quantity],
    );
  }

  /// `Arriving to`
  String get arrivingTo {
    return Intl.message(
      'Arriving to',
      name: 'arrivingTo',
      desc: '',
      args: [],
    );
  }

  /// `Executed Request`
  String get executedRequest {
    return Intl.message(
      'Executed Request',
      name: 'executedRequest',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Delivery fee`
  String get deliveryFee {
    return Intl.message(
      'Delivery fee',
      name: 'deliveryFee',
      desc: '',
      args: [],
    );
  }

  /// `Tax`
  String get tax {
    return Intl.message(
      'Tax',
      name: 'tax',
      desc: '',
      args: [],
    );
  }

  /// `Estimated time of arrival (ETA)`
  String get eta {
    return Intl.message(
      'Estimated time of arrival (ETA)',
      name: 'eta',
      desc: '',
      args: [],
    );
  }

  /// `Updated at {date}`
  String updatedAt(String date) {
    return Intl.message(
      'Updated at $date',
      name: 'updatedAt',
      desc: '',
      args: [date],
    );
  }

  /// `Cancel Order`
  String get cancelOrder {
    return Intl.message(
      'Cancel Order',
      name: 'cancelOrder',
      desc: '',
      args: [],
    );
  }

  /// `Yes, Cancel`
  String get yesCancel {
    return Intl.message(
      'Yes, Cancel',
      name: 'yesCancel',
      desc: '',
      args: [],
    );
  }

  /// `No, Close`
  String get noClose {
    return Intl.message(
      'No, Close',
      name: 'noClose',
      desc: '',
      args: [],
    );
  }

  /// `Track Order`
  String get trackOrder {
    return Intl.message(
      'Track Order',
      name: 'trackOrder',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `{amount} SAR`
  String price(String amount) {
    return Intl.message(
      '$amount SAR',
      name: 'price',
      desc: '',
      args: [amount],
    );
  }

  /// `Order accepted`
  String get orderAccepted {
    return Intl.message(
      'Order accepted',
      name: 'orderAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Order prepared for delivery`
  String get orderPreparedForDelivery {
    return Intl.message(
      'Order prepared for delivery',
      name: 'orderPreparedForDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Your order is ready for delivery`
  String get yourOrderIsReadyForDelivery {
    return Intl.message(
      'Your order is ready for delivery',
      name: 'yourOrderIsReadyForDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Order successfully delivered`
  String get orderSuccessfullyDelivered {
    return Intl.message(
      'Order successfully delivered',
      name: 'orderSuccessfullyDelivered',
      desc: '',
      args: [],
    );
  }

  /// `Add new address`
  String get addNewAddress {
    return Intl.message(
      'Add new address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Building No.`
  String get buildingNo {
    return Intl.message(
      'Building No.',
      name: 'buildingNo',
      desc: '',
      args: [],
    );
  }

  /// `Flat No.`
  String get flatNo {
    return Intl.message(
      'Flat No.',
      name: 'flatNo',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Postal Code`
  String get postalCode {
    return Intl.message(
      'Postal Code',
      name: 'postalCode',
      desc: '',
      args: [],
    );
  }

  /// `Add Address`
  String get addAddress {
    return Intl.message(
      'Add Address',
      name: 'addAddress',
      desc: '',
      args: [],
    );
  }

  /// `Choose Address`
  String get chooseAddress {
    return Intl.message(
      'Choose Address',
      name: 'chooseAddress',
      desc: '',
      args: [],
    );
  }

  /// `Complete payment`
  String get completePayment {
    return Intl.message(
      'Complete payment',
      name: 'completePayment',
      desc: '',
      args: [],
    );
  }

  /// `Your bag is empty`
  String get yourBagIsEmpty {
    return Intl.message(
      'Your bag is empty',
      name: 'yourBagIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any favorite products`
  String get youDontHaveAnyFavoriteProducts {
    return Intl.message(
      'You don\'t have any favorite products',
      name: 'youDontHaveAnyFavoriteProducts',
      desc: '',
      args: [],
    );
  }

  /// `Account updated successfully`
  String get accountUpdatedSuccessfully {
    return Intl.message(
      'Account updated successfully',
      name: 'accountUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Account deleted successfully, you will be logged out.`
  String get accountDeletedSuccessfully {
    return Intl.message(
      'Account deleted successfully, you will be logged out.',
      name: 'accountDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get areYouSureDelete {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'areYouSureDelete',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Order`
  String get confirmOrder {
    return Intl.message(
      'Confirm Order',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm & proceed with your order`
  String get pleaseConfirmProceedWithYourOrder {
    return Intl.message(
      'Please confirm & proceed with your order',
      name: 'pleaseConfirmProceedWithYourOrder',
      desc: '',
      args: [],
    );
  }

  /// `Recipient info`
  String get recipientInfo {
    return Intl.message(
      'Recipient info',
      name: 'recipientInfo',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Add promo code`
  String get addPromoCode {
    return Intl.message(
      'Add promo code',
      name: 'addPromoCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter your promo code`
  String get enterYourPromoCode {
    return Intl.message(
      'Enter your promo code',
      name: 'enterYourPromoCode',
      desc: '',
      args: [],
    );
  }

  /// `Apply coupon`
  String get applyCoupon {
    return Intl.message(
      'Apply coupon',
      name: 'applyCoupon',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get orderSummary {
    return Intl.message(
      'Order Summary',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Order placed successfully`
  String get orderPlacedSuccessfully {
    return Intl.message(
      'Order placed successfully',
      name: 'orderPlacedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Order failed, please try again`
  String get orderFailedPleaseTryAgain {
    return Intl.message(
      'Order failed, please try again',
      name: 'orderFailedPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Place Order`
  String get placeOrder {
    return Intl.message(
      'Place Order',
      name: 'placeOrder',
      desc: '',
      args: [],
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
