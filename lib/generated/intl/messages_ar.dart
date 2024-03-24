// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(email) => "تم تسجيل البريد الإلكتروني: ${email} بنجاح";

  static String m1(errCode, err) => "خطأ: ${errCode}، ${err}";

  static String m2(userName) =>
      "تم تسجيل الدخول بنجاح، مرحبًا مرة أخرى ${userName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountNotActivated": MessageLookupByLibrary.simpleMessage(
            "لم يتم تنشيط حسابك بعد. الرجاء التحقق من بريدك الإلكتروني للحصول على رمز التفعيل أو حاول مرة أخرى لاحقًا."),
        "activationSuccess": MessageLookupByLibrary.simpleMessage(
            "تم تفعيل حسابك بنجاح. يمكنك الآن تسجيل الدخول والوصول إلى حسابك."),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("هل لديك حساب بالفعل؟"),
        "bad_gateway": MessageLookupByLibrary.simpleMessage(
            "بيانات غير صالحة، يرجى المحاولة مرة أخرى"),
        "bad_request_error": MessageLookupByLibrary.simpleMessage(
            "طلب غير صالح. حاول مرة أخرى لاحقًا"),
        "cache_error": MessageLookupByLibrary.simpleMessage(
            "خطأ في ذاكرة التخزين المؤقت , حاول مرة أخرى لاحقًا"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("تغيير كلمة المرور"),
        "codeCantBeLessThan4Characters": MessageLookupByLibrary.simpleMessage(
            "لا يمكن أن يكون طول الرمز أقل من 4 أحرف"),
        "confirmNewPassword":
            MessageLookupByLibrary.simpleMessage("تأكيد كلمة المرور الجديدة"),
        "conflict_error": MessageLookupByLibrary.simpleMessage(
            "تم العثور على تعارض , حاول مرة أخرى لاحقًا"),
        "default_error": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ ما , حاول مرة أخرى لاحقًا"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("ليس لديك حساب؟"),
        "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
        "emailAlreadyExist": MessageLookupByLibrary.simpleMessage(
            "عذرًا، هذا البريد الإلكتروني مسجل بالفعل. الرجاء استخدام بريد إلكتروني مختلف أو تسجيل الدخول باستخدام حسابك الحالي."),
        "emailCantBeEmpty": MessageLookupByLibrary.simpleMessage(
            "لا يمكن أن يكون البريد الإلكتروني فارغًا"),
        "emailNotRegistered": MessageLookupByLibrary.simpleMessage(
            "عنوان البريد الإلكتروني المُقدم غير مسجل. يرجى التأكد من أنك قد أدخلت البريد الإلكتروني الصحيح أو تابع بإنشاء حساب جديد"),
        "emailRegisteredSuccessful": m0,
        "error": m1,
        "firstName": MessageLookupByLibrary.simpleMessage("الاسم الأول"),
        "forbidden_error": MessageLookupByLibrary.simpleMessage(
            "طلب محظور. حاول مرة أخرى لاحقًا"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("نسيت كلمة المرور"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("نسيت كلمة المرور"),
        "internal_server_error": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ ما , حاول مرة أخرى لاحقًا"),
        "invalidCredentials": MessageLookupByLibrary.simpleMessage(
            "بريد إلكتروني أو كلمة مرور غير صالحة. الرجاء التحقق من بيانات الاعتماد الخاصة بك والمحاولة مرة أخرى."),
        "lastName": MessageLookupByLibrary.simpleMessage("الاسم الأخير"),
        "loggedInSuccessful": m2,
        "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "method_not_allowed_error": MessageLookupByLibrary.simpleMessage(
            "غير مدعوم، يرجى المحاولة مرة أخرى لاحقًا"),
        "moved_permanently":
            MessageLookupByLibrary.simpleMessage("هذا الرابط لم يعد متاحًا"),
        "multiple_choices":
            MessageLookupByLibrary.simpleMessage("اختر خيارًا للمتابعة"),
        "newPassword":
            MessageLookupByLibrary.simpleMessage("كلمة المرور الجديدة"),
        "newPasswordCantBeLessThan8Characters":
            MessageLookupByLibrary.simpleMessage(
                "لا يمكن أن تكون كلمة المرور الجديدة أقل من 8 أحرف"),
        "no_content": MessageLookupByLibrary.simpleMessage("نجاح بدون محتوى"),
        "no_internet_error": MessageLookupByLibrary.simpleMessage(
            "يُرجى التحقق من اتصالك بالإنترنت"),
        "not_found_error": MessageLookupByLibrary.simpleMessage(
            "url غير موجود , حاول مرة أخرى لاحقًا"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "passwordCantBeEmpty": MessageLookupByLibrary.simpleMessage(
            "لا يمكن أن تكون كلمة المرور فارغة"),
        "passwordChangedSuccessful": MessageLookupByLibrary.simpleMessage(
            "تم تغيير كلمة المرور بنجاح. يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة."),
        "passwordConfirmation":
            MessageLookupByLibrary.simpleMessage("تأكيد كلمة المرور"),
        "passwordIsTooShort":
            MessageLookupByLibrary.simpleMessage("كلمة المرور قصيرة جدًا"),
        "passwordsDoNotMatchPleaseTryAgain":
            MessageLookupByLibrary.simpleMessage(
                "كلمات المرور غير متطابقة. الرجاء المحاولة مرة أخرى"),
        "payment_required": MessageLookupByLibrary.simpleMessage("الدفع مطلوب"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
        "pleaseEnterAPassword":
            MessageLookupByLibrary.simpleMessage("الرجاء إدخال كلمة المرور"),
        "pleaseEnterAPasswordWithAtLeast8Characters":
            MessageLookupByLibrary.simpleMessage(
                "الرجاء إدخال كلمة مرور تتكون من 8 أحرف على الأقل"),
        "pleaseEnterAValidEmailAddress": MessageLookupByLibrary.simpleMessage(
            "الرجاء إدخال بريد إلكتروني صالح"),
        "pleaseEnterAValidPhoneNumber":
            MessageLookupByLibrary.simpleMessage("الرجاء إدخال رقم هاتف صالح"),
        "pleaseEnterTheActivationCodeSentToYourEmail":
            MessageLookupByLibrary.simpleMessage(
                "الرجاء إدخال رمز التفعيل المرسل إلى بريدك الإلكتروني"),
        "pleaseEnterVerificationCodeSentToYourEmail":
            MessageLookupByLibrary.simpleMessage(
                "الرجاء إدخال رمز التحقق المرسل إلى بريدك الإلكتروني"),
        "pleaseEnterYourEmailAddress": MessageLookupByLibrary.simpleMessage(
            "الرجاء إدخال بريدك الإلكتروني"),
        "pleaseEnterYourFirstName":
            MessageLookupByLibrary.simpleMessage("الرجاء إدخال الاسم الأول"),
        "pleaseEnterYourLastName":
            MessageLookupByLibrary.simpleMessage("الرجاء إدخال الاسم الأخير"),
        "pleaseEnterYourPhoneNumber":
            MessageLookupByLibrary.simpleMessage("الرجاء إدخال رقم هاتفك"),
        "pleaseReconfirmYourPassword": MessageLookupByLibrary.simpleMessage(
            "الرجاء إعادة تأكيد كلمة المرور"),
        "plzEnterAValidEmail": MessageLookupByLibrary.simpleMessage(
            "الرجاء إدخال بريد إلكتروني صالح"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("تذكرني"),
        "resetPassword":
            MessageLookupByLibrary.simpleMessage("إعادة تعيين كلمة المرور"),
        "resetPasswordBtn": MessageLookupByLibrary.simpleMessage("إعادة تعيين"),
        "sendAgain": MessageLookupByLibrary.simpleMessage("إعادة الإرسال"),
        "service_unavailable":
            MessageLookupByLibrary.simpleMessage("الخادم قيد الصيانة"),
        "signUp": MessageLookupByLibrary.simpleMessage("التسجيل"),
        "submit": MessageLookupByLibrary.simpleMessage("إرسال"),
        "success": MessageLookupByLibrary.simpleMessage("تم بنجاح"),
        "timeout_error": MessageLookupByLibrary.simpleMessage(
            "انتهت المهلة , حاول مرة أخرى لاحقًا"),
        "unauthorized_error": MessageLookupByLibrary.simpleMessage(
            "المستخدم غير مصرح له، جرب مرة أخرى في وقت لاحق"),
        "unknown_error": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ ما , حاول مرة أخرى لاحقًا"),
        "updatePassword":
            MessageLookupByLibrary.simpleMessage("تحديث كلمة المرور"),
        "verify": MessageLookupByLibrary.simpleMessage("تأكيد"),
        "verifyAccount": MessageLookupByLibrary.simpleMessage("تأكيد الحساب"),
        "wrongOtpEntered": MessageLookupByLibrary.simpleMessage(
            "الرمز الذي تم إدخاله غير صحيح. الرجاء التحقق من بريدك الإلكتروني مرة أخرى وإدخال الرمز الصحيح لإعادة تعيين كلمة المرور."),
        "wrongVerifyOtp": MessageLookupByLibrary.simpleMessage(
            "الرمز الذي تم إدخاله غير صحيح. الرجاء التحقق من بريدك الإلكتروني مرة أخرى وإدخال الرمز الصحيح لتأكيد حسابك.")
      };
}
