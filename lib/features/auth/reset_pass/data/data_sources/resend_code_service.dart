import 'package:dio/dio.dart';

import '../../../../../core/service/dio_factory.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/resend_code_entity.dart';
import '../models/resend_code_model.dart';

abstract class ResendCodeService {
  Future<ResendCodeModel> resendOtp(ResetResendCodeEntity resendCodeEntity);
}

class ResendCodeServiceImpl implements ResendCodeService {
  @override
  Future<ResendCodeModel> resendOtp(ResetResendCodeEntity resendCodeEntity) async {
    Dio dio = await DioFactory.getDio();
    ResendCodeModel resendCodeModel = const ResendCodeModel();

    final sendOtp = await dio.post(
      AppConstants.resendCodeUri,
      data: ResendCodeModel.toJson(resendCodeModel),
    );

    if (sendOtp.statusCode == 200) {
      resendCodeModel = ResendCodeModel.fromJson(sendOtp.data);
    }

    return resendCodeModel;
  }
}
