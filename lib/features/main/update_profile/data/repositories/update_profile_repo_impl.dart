import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/update_profile_entity.dart';
import '../../domain/repositories/update_profile_repo.dart';
import '../data_sources/delete_account_service.dart';
import '../data_sources/update_profile_service.dart';

class UpdateProfileRepoImpl implements UpdateProfileRepo {
  final UpdateProfileService updateProfileService;
  final DeleteAccountService deleteAccountService;

  UpdateProfileRepoImpl(
      {required this.updateProfileService, required this.deleteAccountService});

  @override
  Future<Either<Failure, UpdateProfileEntity>> deleteProfile(
      UpdateProfileEntity updateProfileEntity) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final delete =
            await deleteAccountService.deleteAccount(updateProfileEntity);
        return right(delete);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, UpdateProfileEntity>> editProfile(
      UpdateProfileEntity deleteAccountEntity) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final edit =
            await updateProfileService.updateProfile(deleteAccountEntity);
        return right(edit);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
