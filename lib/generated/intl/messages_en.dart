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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "bad_gateway": MessageLookupByLibrary.simpleMessage(
            "Invalid data, please try again"),
        "bad_request_error": MessageLookupByLibrary.simpleMessage(
            "bad request. try again later"),
        "cache_error": MessageLookupByLibrary.simpleMessage(
            "cache error, try again later"),
        "conflict_error": MessageLookupByLibrary.simpleMessage(
            "conflict found, try again later"),
        "default_error": MessageLookupByLibrary.simpleMessage(
            "some thing went wrong, try again later"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don’t Have An account"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailCantBeEmpty":
            MessageLookupByLibrary.simpleMessage("Email can\'t be empty"),
        "forbidden_error": MessageLookupByLibrary.simpleMessage(
            "forbidden request. try again later"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password"),
        "internal_server_error": MessageLookupByLibrary.simpleMessage(
            "some thing went wrong, try again later"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "method_not_allowed_error": MessageLookupByLibrary.simpleMessage(
            "Unsupported, please try Again later"),
        "moved_permanently": MessageLookupByLibrary.simpleMessage(
            "This URL is no longer available"),
        "multiple_choices": MessageLookupByLibrary.simpleMessage(
            "Choose an option to continue"),
        "no_content":
            MessageLookupByLibrary.simpleMessage("success with not content"),
        "no_internet_error": MessageLookupByLibrary.simpleMessage(
            "Please check your internet connection"),
        "not_found_error": MessageLookupByLibrary.simpleMessage(
            "url not found, try again later"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordCantBeEmpty":
            MessageLookupByLibrary.simpleMessage("Password can\'t be empty"),
        "passwordIsTooShort":
            MessageLookupByLibrary.simpleMessage("Password is too short"),
        "payment_required":
            MessageLookupByLibrary.simpleMessage("Payment Required"),
        "plzEnterAValidEmail":
            MessageLookupByLibrary.simpleMessage("Please enter a valid email"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember Me"),
        "service_unavailable":
            MessageLookupByLibrary.simpleMessage("Server is under maintenance"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "success": MessageLookupByLibrary.simpleMessage("success"),
        "timeout_error":
            MessageLookupByLibrary.simpleMessage("time out, try again late"),
        "unauthorized_error": MessageLookupByLibrary.simpleMessage(
            "user unauthorized, try again later"),
        "unknown_error": MessageLookupByLibrary.simpleMessage(
            "some thing went wrong, try again later"),
        "unprocessable_content_error": MessageLookupByLibrary.simpleMessage(
            "unprocessable data, check it and try again")
      };
}
