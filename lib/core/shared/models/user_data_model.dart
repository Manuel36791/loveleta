import 'package:equatable/equatable.dart';

import '../../utils/app_constants.dart';

class UserData extends Equatable {
  static num? id;
  static String? firstName;
  static String? lastName;
  static String? avatar;
  static String? email;
  static String? pass;
  static String? passConf;
  static String? phone;
  static String? address;
  static String? otp;
  static num? status;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? AppConstants.unknownNumValue; // 2077
    firstName = json["first_name"] ?? AppConstants.unknownStringValue; // UNKNOWN STRING VALUE
    lastName = json["last_name"] ?? AppConstants.unknownStringValue; // UNKNOWN STRING VALUE
    avatar = json["avatar"] ?? AppConstants.unknownStringValue;
    email = json["email"] ?? AppConstants.unknownStringValue;
    pass = json["password"] ?? AppConstants.unknownStringValue;
    passConf = json["password_confirmation"] ?? AppConstants.unknownStringValue;
    phone = json["phone"] ?? AppConstants.unknownStringValue;
    otp = json['otp'] ?? AppConstants.unknownStringValue;
    status = json['status'] ?? AppConstants.unknownNumValue;
  }

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": pass,
        "password_confirmation": passConf,
      };

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        avatar,
        email,
        pass,
        passConf,
        phone,
        address,
        otp,
        status,
      ];
}



