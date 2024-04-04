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

  static String m0(availability) => "التوفر: ${availability}";

  static String m1(email) => "تم تسجيل البريد الإلكتروني: ${email} بنجاح";

  static String m2(errCode, err) => "خطأ: ${errCode}، ${err}";

  static String m3(userName) =>
      "تم تسجيل الدخول بنجاح، مرحبًا مرة أخرى ${userName}";

  static String m4(orderNo) => "رقم الطلب #${orderNo}";

  static String m5(amount) => "${amount} ريال سعودي";

  static String m6(quantity) => "الكمية: ${quantity}";

  static String m7(price) => "ريال سعودي ${price}";

  static String m8(SKU) => "SKU: ${SKU}";

  static String m9(date) => "تم التحديث في ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "تم حذف الحساب بنجاح، ستتم تسجيل الخروج."),
        "accountNotActivated": MessageLookupByLibrary.simpleMessage(
            "لم يتم تنشيط حسابك بعد. الرجاء التحقق من بريدك الإلكتروني للحصول على رمز التفعيل أو حاول مرة أخرى لاحقًا."),
        "accountUpdatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تحديث الحساب بنجاح"),
        "activationSuccess": MessageLookupByLibrary.simpleMessage(
            "تم تفعيل حسابك بنجاح. يمكنك الآن تسجيل الدخول والوصول إلى حسابك."),
        "addAddress": MessageLookupByLibrary.simpleMessage("إضافة العنوان"),
        "addNewAddress":
            MessageLookupByLibrary.simpleMessage("إضافة عنوان جديد"),
        "addPromoCode":
            MessageLookupByLibrary.simpleMessage("إضافة رمز ترويجي"),
        "addToCart": MessageLookupByLibrary.simpleMessage("أضف إلى السلة"),
        "address": MessageLookupByLibrary.simpleMessage("العنوان"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("هل لديك حساب بالفعل؟"),
        "amount": MessageLookupByLibrary.simpleMessage("المبلغ"),
        "applyCoupon": MessageLookupByLibrary.simpleMessage("تطبيق الكوبون"),
        "areYouSureDelete": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد أنك تريد حذف حسابك؟"),
        "arrivingTo": MessageLookupByLibrary.simpleMessage("الوصول إلى"),
        "availability": m0,
        "bad_gateway": MessageLookupByLibrary.simpleMessage(
            "بيانات غير صالحة، يرجى المحاولة مرة أخرى"),
        "bad_request_error": MessageLookupByLibrary.simpleMessage(
            "طلب غير صالح. حاول مرة أخرى لاحقًا"),
        "bag": MessageLookupByLibrary.simpleMessage("الحقيبة"),
        "bestSellers": MessageLookupByLibrary.simpleMessage("الأكثر مبيعًا"),
        "buildingNo": MessageLookupByLibrary.simpleMessage("رقم المبنى"),
        "cache_error": MessageLookupByLibrary.simpleMessage(
            "خطأ في ذاكرة التخزين المؤقت , حاول مرة أخرى لاحقًا"),
        "cancelOrder": MessageLookupByLibrary.simpleMessage("إلغاء الطلب"),
        "cancelled": MessageLookupByLibrary.simpleMessage("تم الإلغاء"),
        "categories": MessageLookupByLibrary.simpleMessage("الفئات"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("تغيير كلمة المرور"),
        "chooseAddress": MessageLookupByLibrary.simpleMessage("اختر العنوان"),
        "city": MessageLookupByLibrary.simpleMessage("المدينة"),
        "codeCantBeLessThan6Characters": MessageLookupByLibrary.simpleMessage(
            "لا يمكن أن يكون طول الرمز أقل من 6 أحرف"),
        "color": MessageLookupByLibrary.simpleMessage("اللون"),
        "completePayment": MessageLookupByLibrary.simpleMessage("إكمال الدفع"),
        "confirmNewPassword":
            MessageLookupByLibrary.simpleMessage("تأكيد كلمة المرور الجديدة"),
        "confirmOrder": MessageLookupByLibrary.simpleMessage("تأكيد الطلب"),
        "conflict_error": MessageLookupByLibrary.simpleMessage(
            "تم العثور على تعارض , حاول مرة أخرى لاحقًا"),
        "contactUs": MessageLookupByLibrary.simpleMessage("اتصل بنا"),
        "country": MessageLookupByLibrary.simpleMessage("البلد"),
        "default_error": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ ما , حاول مرة أخرى لاحقًا"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("حذف الحساب"),
        "delivered": MessageLookupByLibrary.simpleMessage("تم التوصيل"),
        "deliveryFee": MessageLookupByLibrary.simpleMessage("رسوم التوصيل"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("ليس لديك حساب؟"),
        "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
        "emailAlreadyExist": MessageLookupByLibrary.simpleMessage(
            "عذرًا، هذا البريد الإلكتروني مسجل بالفعل. الرجاء استخدام بريد إلكتروني مختلف أو تسجيل الدخول باستخدام حسابك الحالي."),
        "emailCantBeEmpty": MessageLookupByLibrary.simpleMessage(
            "لا يمكن أن يكون البريد الإلكتروني فارغًا"),
        "emailNotRegistered": MessageLookupByLibrary.simpleMessage(
            "عنوان البريد الإلكتروني المُقدم غير مسجل. يرجى التأكد من أنك قد أدخلت البريد الإلكتروني الصحيح أو تابع بإنشاء حساب جديد"),
        "emailRegisteredSuccessful": m1,
        "enterYourPromoCode":
            MessageLookupByLibrary.simpleMessage("ادخل رمز الترويج الخاص بك"),
        "error": m2,
        "eta":
            MessageLookupByLibrary.simpleMessage("الوقت المقدر للوصول (ETA)"),
        "executedRequest": MessageLookupByLibrary.simpleMessage("الطلب المنفذ"),
        "favorites": MessageLookupByLibrary.simpleMessage("المفضلة"),
        "firstName": MessageLookupByLibrary.simpleMessage("الاسم الأول"),
        "flatNo": MessageLookupByLibrary.simpleMessage("رقم الشقة"),
        "forbidden_error": MessageLookupByLibrary.simpleMessage(
            "طلب محظور. حاول مرة أخرى لاحقًا"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("نسيت كلمة المرور"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("نسيت كلمة المرور"),
        "freeDelivery": MessageLookupByLibrary.simpleMessage("توصيل مجاني"),
        "giftDetails": MessageLookupByLibrary.simpleMessage("تفاصيل الهدية"),
        "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
        "inStock": MessageLookupByLibrary.simpleMessage("متوفر"),
        "internal_server_error": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ ما , حاول مرة أخرى لاحقًا"),
        "invalidCredentials": MessageLookupByLibrary.simpleMessage(
            "بريد إلكتروني أو كلمة مرور غير صالحة. الرجاء التحقق من بيانات الاعتماد الخاصة بك والمحاولة مرة أخرى."),
        "invalidEmailAddress": MessageLookupByLibrary.simpleMessage(
            "عنوان البريد الإلكتروني غير صالح. الرجاء التحقق من بريدك الإلكتروني والمحاولة مرة أخرى."),
        "language": MessageLookupByLibrary.simpleMessage("اللغة"),
        "lastName": MessageLookupByLibrary.simpleMessage("الاسم الأخير"),
        "loggedInSuccessful": m3,
        "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "loveletaExpress":
            MessageLookupByLibrary.simpleMessage("لوفليتا إكسبريس"),
        "method_not_allowed_error": MessageLookupByLibrary.simpleMessage(
            "غير مدعوم، يرجى المحاولة مرة أخرى لاحقًا"),
        "moved_permanently":
            MessageLookupByLibrary.simpleMessage("هذا الرابط لم يعد متاحًا"),
        "multiple_choices":
            MessageLookupByLibrary.simpleMessage("اختر خيارًا للمتابعة"),
        "name": MessageLookupByLibrary.simpleMessage("الاسم"),
        "newArrivals": MessageLookupByLibrary.simpleMessage("الوصولات الجديدة"),
        "newOtpSent": MessageLookupByLibrary.simpleMessage(
            "تم إعادة إرسال رمز التحقق إلى بريدك الإلكتروني. الرجاء التحقق من صندوق الوارد الخاص بك وإدخال الرمز الجديد للمتابعة."),
        "newPassword":
            MessageLookupByLibrary.simpleMessage("كلمة المرور الجديدة"),
        "newPasswordCantBeLessThan8Characters":
            MessageLookupByLibrary.simpleMessage(
                "لا يمكن أن تكون كلمة المرور الجديدة أقل من 8 أحرف"),
        "no": MessageLookupByLibrary.simpleMessage("لا"),
        "noClose": MessageLookupByLibrary.simpleMessage("لا، إغلاق"),
        "no_content": MessageLookupByLibrary.simpleMessage("نجاح بدون محتوى"),
        "no_internet_error": MessageLookupByLibrary.simpleMessage(
            "يُرجى التحقق من اتصالك بالإنترنت"),
        "not_found_error": MessageLookupByLibrary.simpleMessage(
            "url غير موجود , حاول مرة أخرى لاحقًا"),
        "orderAccepted": MessageLookupByLibrary.simpleMessage("تم قبول الطلب"),
        "orderFailedPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "فشل الطلب، يرجى المحاولة مرة أخرى"),
        "orderNumber": m4,
        "orderPlacedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تقديم الطلب بنجاح"),
        "orderPreparedForDelivery":
            MessageLookupByLibrary.simpleMessage("تم تجهيز الطلب للتسليم"),
        "orderSuccessfullyDelivered":
            MessageLookupByLibrary.simpleMessage("تم تسليم الطلب بنجاح"),
        "orderSummary": MessageLookupByLibrary.simpleMessage("ملخص الطلب"),
        "orders": MessageLookupByLibrary.simpleMessage("الطلبات"),
        "outOfStock": MessageLookupByLibrary.simpleMessage("غير متوفر"),
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
        "pending": MessageLookupByLibrary.simpleMessage("قيد الانتظار"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
        "placeOrder": MessageLookupByLibrary.simpleMessage("تقديم الطلب"),
        "pleaseConfirmProceedWithYourOrder":
            MessageLookupByLibrary.simpleMessage("يرجى تأكيد ومتابعة طلبك"),
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
        "postalCode": MessageLookupByLibrary.simpleMessage("الرمز البريدي"),
        "price": m5,
        "privacyDes": MessageLookupByLibrary.simpleMessage(
            "تصف سياسة الخصوصية لدينا كيفية جمعنا ومعالجة معلوماتك الشخصية، مثل المعلومات التي تقدمها من خلال تطبيقنا. توضح السياسة أيضًا حقوقك فيما يتعلق بمعلوماتك الشخصية، وكيفية الاحتفاظ بها، وتأمينها. التواصل: يتم توفير قنوات تواصل مختلفة في حالة وجود أي أسئلة أو استفسارات حول سياسة الخصوصية. يمكنك التحدث مع الفريق من خلال التطبيق، أو الاتصال بالرقم المحدد، أو الاتصال بهم عبر البريد الإلكتروني. التحديثات: في حالة وجود أي تغييرات في طريقة معالجة المعلومات الشخصية أو في السياسة نفسها، ستتلقى إشعارًا عاجلاً عبر البريد الإلكتروني وسيتم تحديث التطبيق."),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("سياسة الخصوصية"),
        "processing": MessageLookupByLibrary.simpleMessage("قيد المعالجة"),
        "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
        "qty": m6,
        "recipientInfo":
            MessageLookupByLibrary.simpleMessage("معلومات المستلم"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("تذكرني"),
        "resetPassword":
            MessageLookupByLibrary.simpleMessage("إعادة تعيين كلمة المرور"),
        "resetPasswordBtn": MessageLookupByLibrary.simpleMessage("إعادة تعيين"),
        "sar": m7,
        "savedAddresses":
            MessageLookupByLibrary.simpleMessage("العناوين المحفوظة"),
        "search": MessageLookupByLibrary.simpleMessage(
            "ابحث عن الهدايا، الزهور، الكعك..."),
        "seeAll": MessageLookupByLibrary.simpleMessage("عرض الكل"),
        "sendAgain": MessageLookupByLibrary.simpleMessage("إعادة الإرسال"),
        "service_unavailable":
            MessageLookupByLibrary.simpleMessage("الخادم قيد الصيانة"),
        "shipped": MessageLookupByLibrary.simpleMessage("تم الشحن"),
        "signUp": MessageLookupByLibrary.simpleMessage("التسجيل"),
        "sku": m8,
        "submit": MessageLookupByLibrary.simpleMessage("إرسال"),
        "subtotal": MessageLookupByLibrary.simpleMessage("المجموع الفرعي"),
        "success": MessageLookupByLibrary.simpleMessage("تم بنجاح"),
        "tax": MessageLookupByLibrary.simpleMessage("الضريبة"),
        "timeout_error": MessageLookupByLibrary.simpleMessage(
            "انتهت المهلة , حاول مرة أخرى لاحقًا"),
        "total": MessageLookupByLibrary.simpleMessage("المجموع"),
        "trackOrder": MessageLookupByLibrary.simpleMessage("تتبع الطلب"),
        "unauthorized_error": MessageLookupByLibrary.simpleMessage(
            "المستخدم غير مصرح له، جرب مرة أخرى في وقت لاحق"),
        "unknown_error": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ ما , حاول مرة أخرى لاحقًا"),
        "update": MessageLookupByLibrary.simpleMessage("تحديث"),
        "updatePassword":
            MessageLookupByLibrary.simpleMessage("تحديث كلمة المرور"),
        "updateProfile":
            MessageLookupByLibrary.simpleMessage("تحديث الملف الشخصي"),
        "updatedAt": m9,
        "verify": MessageLookupByLibrary.simpleMessage("تأكيد"),
        "verifyAccount": MessageLookupByLibrary.simpleMessage("تأكيد الحساب"),
        "wrongOtpEntered": MessageLookupByLibrary.simpleMessage(
            "الرمز الذي تم إدخاله غير صحيح. الرجاء التحقق من بريدك الإلكتروني مرة أخرى وإدخال الرمز الصحيح لإعادة تعيين كلمة المرور."),
        "wrongVerifyOtp": MessageLookupByLibrary.simpleMessage(
            "الرمز الذي تم إدخاله غير صحيح. الرجاء التحقق من بريدك الإلكتروني مرة أخرى وإدخال الرمز الصحيح لتأكيد حسابك."),
        "yes": MessageLookupByLibrary.simpleMessage("نعم"),
        "yesCancel": MessageLookupByLibrary.simpleMessage("نعم، إلغاء"),
        "youDontHaveAnyFavoriteProducts":
            MessageLookupByLibrary.simpleMessage("ليس لديك أي منتجات مفضلة"),
        "youHaveNoOrdersYet":
            MessageLookupByLibrary.simpleMessage("ليس لديك أي طلبات حاليًا"),
        "yourBagIsEmpty":
            MessageLookupByLibrary.simpleMessage("سلة التسوق الخاصة بك فارغة"),
        "yourOrderIsReadyForDelivery":
            MessageLookupByLibrary.simpleMessage("طلبك جاهز للتسليم")
      };
}
