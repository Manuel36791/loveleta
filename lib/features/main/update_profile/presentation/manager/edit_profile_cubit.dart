import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../core/shared/models/user_data_model.dart';
import '../../domain/entities/update_profile_entity.dart';
import '../../domain/use_cases/delete_account_use_case.dart';
import '../../domain/use_cases/update_profile_use_case.dart';

part 'edit_profile_states.dart';
part 'edit_profile_cubit.freezed.dart';

class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileCubit({required this.deleteAccountUseCase, required this.editProfileUseCase,}) : super(const EditProfileStates.initial());

  final DeleteAccountUseCase deleteAccountUseCase;
  final UpdateProfileUseCase editProfileUseCase;

  static EditProfileCubit get(context) => BlocProvider.of(context);

  deleteAccount(UpdateProfileEntity editProfileEntity) async {
    emit(const EditProfileStates.loading());

    final send = await deleteAccountUseCase(editProfileEntity);

    send.fold(
          (l) => {
        emit(
          EditProfileStates.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          EditProfileStates.deleteSuccess(r),
        ),
      },
    );
  }

  editProfile(UpdateProfileEntity editProfileEntity) async {
    emit(const EditProfileStates.loading());

    final send = await editProfileUseCase(editProfileEntity);

    send.fold(
          (l) => {
        emit(
          EditProfileStates.error(
            l.code.toString(),
            l.message,
          ),
        ),
      },
          (r) => {
        emit(
          EditProfileStates.success(r),
        ),
      },
    );
  }

  var firstNameCtrl = BehaviorSubject<String>();
  var lastNameCtrl = BehaviorSubject<String>();
  var phoneCtrl = BehaviorSubject<String>();
  var passCtrl = BehaviorSubject<String>();
  var passConfCtrl = BehaviorSubject<String>();

  Stream<String> get firstNameStream => firstNameCtrl.stream;
  Stream<String> get lastNameStream => lastNameCtrl.stream;
  Stream<String> get phoneStream => phoneCtrl.stream;
  Stream<String> get passStream => passCtrl.stream;
  Stream<String> get passConfStream => passConfCtrl.stream;


  userData() async {
    firstNameCtrl.sink.add(UserData.firstName!);
    lastNameCtrl.sink.add(UserData.lastName!);
    phoneCtrl.sink.add(UserData.phone!);
  }

}
