import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/change_password/presentation/manager/change_pass_cubit.dart';
import '../../features/auth/forgot_pass/presentation/manager/forgot_pass_cubit.dart';
import '../../features/auth/login/presentation/manager/login_cubit.dart';
import '../../features/auth/register/presentation/manager/register_cubit.dart';
import '../../features/auth/reset_pass/presentation/manager/reset_pass_cubit.dart';
import '../../features/auth/verify_account/presentation/manager/verify_account_cubit.dart';

final di = GetIt.instance;

Future<void> init() async {
  /// Login
  di.registerFactory(() => LoginCubit());

  /// Register
  di.registerFactory(() => RegisterCubit());

  /// Verify Account
  di.registerFactory(() => VerifyAccountCubit());

  /// Forgot Password
  di.registerFactory(() => ForgotPassCubit());

  /// Reset Password
  di.registerFactory(() => ResetPassCubit());

  /// Change Password
  di.registerFactory(() => ChangePassCubit());

  /// external
  final sharedPrefs = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPrefs);
}
