class AppConstants {
  static RegExp emailRegExp = RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
  static RegExp passRegExp = RegExp(r"(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\\$&*~]).{8,}");
  static RegExp phoneRegExp = RegExp(r"(?:[+0][1-9])?[0-9]{9,12}");

  //? Consts for language manager
  static const arabic = "ar";
  static const english = "en";
  static const prefsLangKey = "prefsLangKey";

  // * Main UI constants
  static const mainFontFamily = "Open Sans";
  static const subFontFamily = "";
  static const unknownStringValue = "UNKNOWN STRING VALUE";
  static const unknownNumValue = 2077;

  //! API headers
  static const String applicationJson = "application/json";
  static String userToken = "";
  // static const String bearerToken = "";
  // static const apiToken = "Bearer $bearerToken";
  static const apiTimeOut = 60000;
  static String? fcmToken = "";

  // * API URIs
  static const apiBaseUrl = "https://loveleta.coddiv.com/api/";
  static const imageUrl = "https://loveleta.coddiv.com/";
  static const loginUri = "auth/login";
  static const registerUri = "auth/register";
  static const verifyAccountUri = "auth/account_verification";
  static const resendCodeUri = "auth/resend-code";
  static const forgotPassUri = "auth/forget-password";
  static const resetPassUri = "auth/reset-password";
  static const changePassUri = "auth/change-password";
  static const getCategoriesUri = "v1/categories";
  static const getProductsByCatUri = "v1/categories/products";
  static const getProductsBySubCatUri = "v1/subcategories/products";
  static const getNewProductsUri = "v1/products/new";
  static const getBestProductsUri = "v1/products/best-seller";
  static const getOrdersUri = "v1/orders";
  static const placeOrderUri = "v1/order/store";
  static const cancelOrderUri = "v1/order/cancel";
  static const updateProfileUri = "v1/profile/update";
  static const deleteProfileUri = "v1/profile/delete";
  static const getFavoriteProductsUri = "v1/products/get-my-favourite";
  static const addToFavoritesUri = "v1/products/add-to-favourite";
  static const checkIfFavoriteUri = "v1/products/check-if-favourite";
}