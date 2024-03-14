import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/auth/forgot_pass/presentation/manager/forgot_pass_cubit.dart';
import '../../feature/auth/login/presentation/manager/login_cubit.dart';
import '../../feature/auth/register/presentation/manager/register_cubit.dart';
import '../../feature/auth/reset_pass/presentation/manager/reset_pass_cubit.dart';
import '../../feature/auth/verify_account/presentation/manager/verify_account_cubit.dart';

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

  /// external
  final sharedPrefs = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPrefs);
}
