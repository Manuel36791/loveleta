import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/update_profile_entity.dart';
import '../repositories/update_profile_repo.dart';


class UpdateProfileUseCase {
  final UpdateProfileRepo editProfileRepo;

  UpdateProfileUseCase({required this.editProfileRepo});

  Future<Either<Failure,UpdateProfileEntity>> call(UpdateProfileEntity updateProfileEntity) async {
    return await editProfileRepo.editProfile(updateProfileEntity);
  }
}
