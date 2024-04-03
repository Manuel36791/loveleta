import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/update_profile_entity.dart';


abstract class UpdateProfileRepo {
  Future<Either<Failure,UpdateProfileEntity>> deleteProfile(UpdateProfileEntity updateProfileEntity);
  Future<Either<Failure,UpdateProfileEntity>> editProfile(UpdateProfileEntity deleteEntity);

}
