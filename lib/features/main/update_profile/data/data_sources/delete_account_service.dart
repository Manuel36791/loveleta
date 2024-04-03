import 'package:dio/dio.dart';

import '../../../../../core/service/dio_factory.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/update_profile_entity.dart';
import '../models/update_profile_model.dart';

abstract class DeleteAccountService {
  Future<UpdateProfileModel> deleteAccount(UpdateProfileEntity editProfileEntity);
}

class DeleteAccountServiceImpl implements DeleteAccountService {
  @override
  Future<UpdateProfileModel> deleteAccount(UpdateProfileEntity editProfileEntity) async {
    Dio dio = await DioFactory.getDio();
    UpdateProfileModel editProfileModel = const UpdateProfileModel();

    final delete = await dio.get(
      AppConstants.deleteProfileUri,
      queryParameters: UpdateProfileModel.deleteAccountToJson(editProfileEntity),
    );
    if (delete.statusCode == 200) {
      editProfileModel = UpdateProfileModel.fromJson(delete.data);
    }
    return editProfileModel;
  }
}