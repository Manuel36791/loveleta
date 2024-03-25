import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../entities/resend_code_entity.dart';
import '../repositories/reset_pass_repo.dart';

class ResendCodeUseCase {
  final ResetPassRepo resetPassRepo;

  ResendCodeUseCase({required this.resetPassRepo});

  Future<Either<Failure, ResetResendCodeEntity>> call(ResetResendCodeEntity resendCodeEntity) async {
    return await resetPassRepo.resendCode(resendCodeEntity);
  }
}