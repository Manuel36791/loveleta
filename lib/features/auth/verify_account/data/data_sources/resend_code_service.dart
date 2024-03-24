import 'package:dio/dio.dart';

import '../../../../../core/service/dio_factory.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/resend_code_entity.dart';
import '../models/resend_code_model.dart';

abstract class VerifyResendCodeService {
  Future<ResendCodeModel> resendOtp(ResendCodeEntity resendCodeEntity);
}

class VerifyResendCodeServiceImpl implements VerifyResendCodeService {
  @override
  Future<ResendCodeModel> resendOtp(ResendCodeEntity resendCodeEntity) async {
    Dio dio = await DioFactory.getDio();
    ResendCodeModel resendCodeEntity = const ResendCodeModel();

    final sendOtp = await dio.post(
      AppConstants.resendCodeUri,
      data: ResendCodeModel.toJson(resendCodeEntity),
    );

    if (sendOtp.statusCode == 200) {
      resendCodeEntity = ResendCodeModel.fromJson(sendOtp.data);
    }

    return resendCodeEntity;
  }
}
