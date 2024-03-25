import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../entities/resend_code_entity.dart';
import '../entities/reset_entity.dart';

abstract class ResetPassRepo {
  Future<Either<Failure, ResetPassEntity>> verifyAccount(ResetPassEntity resetPassEntity);
  Future<Either<Failure, ResetResendCodeEntity>> resendCode(ResetResendCodeEntity resendCodeEntity);
}