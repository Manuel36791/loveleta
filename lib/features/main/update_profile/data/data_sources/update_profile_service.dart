import 'package:dio/dio.dart';
import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/update_profile_entity.dart';
import '../models/update_profile_model.dart';

abstract class UpdateProfileService {
  Future<UpdateProfileModel> updateProfile(UpdateProfileEntity updateProfileEntity);
}

class UpdateProfileServiceImpl implements UpdateProfileService {
  @override
  Future<UpdateProfileModel> updateProfile(UpdateProfileEntity updateProfileEntity) async {

    Dio dio = await DioFactory.getDio();
    UpdateProfileModel updateProfileModel = const UpdateProfileModel();

    final edit = await dio.post(
      AppConstants.updateProfileUri,
      data: UpdateProfileModel.updateProfileToJson(updateProfileEntity),
    );

    if (edit.statusCode == 200) {
      updateProfileModel = UpdateProfileModel.fromJson(edit.data);
    }

    return updateProfileModel;
  }
}
