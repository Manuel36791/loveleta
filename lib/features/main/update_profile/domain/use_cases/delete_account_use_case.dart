import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/update_profile_entity.dart';
import '../repositories/update_profile_repo.dart';


class DeleteAccountUseCase {
  final UpdateProfileRepo editProfileRepo;

  DeleteAccountUseCase({required this.editProfileRepo});

  Future<Either<Failure,UpdateProfileEntity>> call(UpdateProfileEntity deleteEntity) async {
    return await editProfileRepo.deleteProfile(deleteEntity);
  }
}
