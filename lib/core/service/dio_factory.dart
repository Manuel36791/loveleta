import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../utils/app_constants.dart';

class DioFactory {
  // private constructor as I don't want to allow creating an instance of this class
  // DioFactory._();

  static Dio? dio;
  static final DioFactory _singleton = DioFactory._internal();

  factory DioFactory() => _singleton;

  DioFactory._internal() {
    getDio();
  }

  // static Future<String?> getToken(String email, String pass) async {
  //   final getToken = await dio!.post("AuthAPI");
  //   CacheHelper.setData("token", getToken);
  //   // final prefs = await SharedPreferences.getInstance();
  //   // return prefs.getString('token');
  //   return CacheHelper.getData("token");
  // }

  static Future<Dio> getDio() async {
    if (dio == null) {
      dio = Dio();
      // final token = await getToken(UserData.email!, UserData.pass!);

      dio!
        ..options.connectTimeout = const Duration(
          milliseconds: AppConstants.apiTimeOut,
        )
        ..options.sendTimeout = const Duration(
          milliseconds: AppConstants.apiTimeOut,
        )
        ..options.receiveTimeout = const Duration(
          milliseconds: AppConstants.apiTimeOut,
        );

      // String language = CacheHelper.getAppLang();

      Map<String, String> headers = {
        "Content-Type": AppConstants.applicationJson,
        "Accept": AppConstants.applicationJson,
        // if (token != null) 'Authorization': 'Bearer $token',
        // "language": language,
      };

      dio!.options = BaseOptions(
        baseUrl: AppConstants.apiBaseUrl,
        headers: headers,
        receiveTimeout: const Duration(
          milliseconds: AppConstants.apiTimeOut,
        ),
        sendTimeout: const Duration(
          milliseconds: AppConstants.apiTimeOut,
        ),
      );

      // loggerInterceptor();
      talkerInterceptor();

      return dio!;
    } else {
      return dio!;
    }
  }

  static void loggerInterceptor() {
    if (!kReleaseMode) {
      dio!.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  static void talkerInterceptor() {
    if (!kReleaseMode) {
      dio!.interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printRequestData: true,
            printResponseHeaders: true,
            printResponseMessage: true,
            printResponseData: true,
          ),
        ),
      );
    }
  }

}

