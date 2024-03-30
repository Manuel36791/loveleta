// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(availability) => "Availability: ${availability}";

  static String m1(email) => "Email: ${email} Registered Successfully";

  static String m2(errCode, err) => "Error: ${errCode}, ${err}";

  static String m3(userName) =>
      "Logged In Successfully. Welcome again ${userName}";

  static String m4(price) => "SAR ${price}";

  static String m5(SKU) => "SKU: ${SKU}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountNotActivated": MessageLookupByLibrary.simpleMessage(
            "Your account is not yet activated. Please check your email for the activation code or try again later."),
        "activationSuccess": MessageLookupByLibrary.simpleMessage(
            "Your account has been successfully activated. You can now log in and access your account."),
        "addToCart": MessageLookupByLibrary.simpleMessage("Add to cart"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "availability": m0,
        "bad_gateway": MessageLookupByLibrary.simpleMessage(
            "Invalid data, please try again"),
        "bad_request_error": MessageLookupByLibrary.simpleMessage(
            "bad request. try again later"),
        "bag": MessageLookupByLibrary.simpleMessage("Bag"),
        "bestSellers": MessageLookupByLibrary.simpleMessage("Best Sellers"),
        "cache_error": MessageLookupByLibrary.simpleMessage(
            "cache error, try again later"),
        "categories": MessageLookupByLibrary.simpleMessage("Categories"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "codeCantBeLessThan6Characters": MessageLookupByLibrary.simpleMessage(
            "Code can\'t be less than 6 characters"),
        "color": MessageLookupByLibrary.simpleMessage("Color"),
        "confirmNewPassword":
            MessageLookupByLibrary.simpleMessage("Confirm New Password"),
        "conflict_error": MessageLookupByLibrary.simpleMessage(
            "conflict found, try again later"),
        "contactUs": MessageLookupByLibrary.simpleMessage("Contact Us"),
        "default_error": MessageLookupByLibrary.simpleMessage(
            "some thing went wrong, try again later"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don’t Have An account"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailAlreadyExist": MessageLookupByLibrary.simpleMessage(
            "This email address is already registered. Please use a different email address or log in with your existing account."),
        "emailCantBeEmpty":
            MessageLookupByLibrary.simpleMessage("Email can\'t be empty"),
        "emailNotRegistered": MessageLookupByLibrary.simpleMessage(
            "The email address provided is not registered. Please ensure you have entered the correct email or proceed with creating a new account"),
        "emailRegisteredSuccessful": m1,
        "error": m2,
        "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
        "forbidden_error": MessageLookupByLibrary.simpleMessage(
            "forbidden request. try again later"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Forget Password"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password"),
        "freeDelivery": MessageLookupByLibrary.simpleMessage("Free Delivery"),
        "giftDetails": MessageLookupByLibrary.simpleMessage("Gift Details"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "inStock": MessageLookupByLibrary.simpleMessage("In Stock"),
        "internal_server_error": MessageLookupByLibrary.simpleMessage(
            "some thing went wrong, try again later"),
        "invalidCredentials": MessageLookupByLibrary.simpleMessage(
            "Invalid email or password. Please check your credentials and try again."),
        "invalidEmailAddress": MessageLookupByLibrary.simpleMessage(
            "Invalid email address, Please check your email and try again."),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
        "loggedInSuccessful": m3,
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loveletaExpress":
            MessageLookupByLibrary.simpleMessage("Loveleta Express"),
        "method_not_allowed_error": MessageLookupByLibrary.simpleMessage(
            "Unsupported, please try Again later"),
        "moved_permanently": MessageLookupByLibrary.simpleMessage(
            "This URL is no longer available"),
        "multiple_choices": MessageLookupByLibrary.simpleMessage(
            "Choose an option to continue"),
        "newArrivals": MessageLookupByLibrary.simpleMessage("New Arrivals"),
        "newOtpSent": MessageLookupByLibrary.simpleMessage(
            "An OTP has been resent to your email. Please check your inbox and enter the new OTP to continue."),
        "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
        "newPasswordCantBeLessThan8Characters":
            MessageLookupByLibrary.simpleMessage(
                "New password can\'t be less than 8 characters"),
        "no_content":
            MessageLookupByLibrary.simpleMessage("success with not content"),
        "no_internet_error": MessageLookupByLibrary.simpleMessage(
            "Please check your internet connection"),
        "not_found_error": MessageLookupByLibrary.simpleMessage(
            "url not found, try again later"),
        "orders": MessageLookupByLibrary.simpleMessage("Orders"),
        "outOfStock": MessageLookupByLibrary.simpleMessage("Out of Stock"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordCantBeEmpty":
            MessageLookupByLibrary.simpleMessage("Password can\'t be empty"),
        "passwordChangedSuccessful": MessageLookupByLibrary.simpleMessage(
            "Your password has been successfully changed. You can now log in with your new password."),
        "passwordConfirmation":
            MessageLookupByLibrary.simpleMessage("Password Confirmation"),
        "passwordIsTooShort":
            MessageLookupByLibrary.simpleMessage("Password is too short"),
        "passwordsDoNotMatchPleaseTryAgain":
            MessageLookupByLibrary.simpleMessage(
                "Passwords do not match. Please try again"),
        "payment_required":
            MessageLookupByLibrary.simpleMessage("Payment Required"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "pleaseEnterAPassword":
            MessageLookupByLibrary.simpleMessage("Please enter a password"),
        "pleaseEnterAPasswordWithAtLeast8Characters":
            MessageLookupByLibrary.simpleMessage(
                "Please enter a password with at least 8 characters"),
        "pleaseEnterAValidEmailAddress": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid email address"),
        "pleaseEnterAValidPhoneNumber": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid phone number"),
        "pleaseEnterTheActivationCodeSentToYourEmail":
            MessageLookupByLibrary.simpleMessage(
                "Please enter the activation code sent to your email"),
        "pleaseEnterVerificationCodeSentToYourEmail":
            MessageLookupByLibrary.simpleMessage(
                "Please enter verification code sent to your email"),
        "pleaseEnterYourEmailAddress": MessageLookupByLibrary.simpleMessage(
            "Please enter your email address"),
        "pleaseEnterYourFirstName": MessageLookupByLibrary.simpleMessage(
            "Please enter your first name"),
        "pleaseEnterYourLastName":
            MessageLookupByLibrary.simpleMessage("Please enter your last name"),
        "pleaseEnterYourPhoneNumber": MessageLookupByLibrary.simpleMessage(
            "Please enter your phone number"),
        "pleaseReconfirmYourPassword": MessageLookupByLibrary.simpleMessage(
            "Please reconfirm your password"),
        "plzEnterAValidEmail":
            MessageLookupByLibrary.simpleMessage("Please enter a valid email"),
        "privacyDes": MessageLookupByLibrary.simpleMessage(
            "Our privacy policy describes how we collect and process your personal information, such as the information you provide through our application. The policy also outlines your rights regarding your personal information, how it is retained, and secured. Communication: Various communication channels are provided in case of any questions or inquiries about the privacy policy. You can speak to the team through the application, call the specified number, or contact them via email.Updates: In the event of any changes in the way personal information is processed or in the policy itself, you will be promptly notified via email and the application will be updated."),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember Me"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "resetPasswordBtn": MessageLookupByLibrary.simpleMessage("Reset Pass"),
        "sar": m4,
        "savedAddresses":
            MessageLookupByLibrary.simpleMessage("Saved addresses"),
        "search": MessageLookupByLibrary.simpleMessage(
            "Search For gifts, flowers Cakes..."),
        "seeAll": MessageLookupByLibrary.simpleMessage("See All"),
        "sendAgain": MessageLookupByLibrary.simpleMessage("Send Again"),
        "service_unavailable":
            MessageLookupByLibrary.simpleMessage("Server is under maintenance"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "sku": m5,
        "submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "success": MessageLookupByLibrary.simpleMessage("success"),
        "timeout_error":
            MessageLookupByLibrary.simpleMessage("time out, try again late"),
        "unauthorized_error": MessageLookupByLibrary.simpleMessage(
            "user unauthorized, try again later"),
        "unknown_error": MessageLookupByLibrary.simpleMessage(
            "some thing went wrong, try again later"),
        "unprocessable_content_error": MessageLookupByLibrary.simpleMessage(
            "unprocessable data, check it and try again"),
        "updatePassword":
            MessageLookupByLibrary.simpleMessage("Update Password"),
        "verify": MessageLookupByLibrary.simpleMessage("Verify"),
        "verifyAccount": MessageLookupByLibrary.simpleMessage("Verify Account"),
        "wrongOtpEntered": MessageLookupByLibrary.simpleMessage(
            "The OTP entered is incorrect. Please check your email again and enter the correct OTP to reset your password"),
        "wrongVerifyOtp": MessageLookupByLibrary.simpleMessage(
            "The OTP entered is incorrect. Please check your email again and enter the correct OTP to verify your account.")
      };
}
