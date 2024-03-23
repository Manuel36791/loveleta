import 'package:get_it/get_it.dart';
import 'package:loveleta/features/auth/login/domain/use_cases/login_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/change_password/presentation/manager/change_pass_cubit.dart';
import '../../features/auth/forgot_pass/presentation/manager/forgot_pass_cubit.dart';
import '../../features/auth/login/data/data_sources/login_service.dart';
import '../../features/auth/login/data/repositories/login_repo_impl.dart';
import '../../features/auth/login/domain/repositories/login_repo.dart';
import '../../features/auth/login/presentation/manager/login_cubit.dart';
import '../../features/auth/register/data/data_sources/register_service.dart';
import '../../features/auth/register/data/repositories/register_repo_impl.dart';
import '../../features/auth/register/domain/repositories/register_repo.dart';
import '../../features/auth/register/domain/use_cases/register_usecase.dart';
import '../../features/auth/register/presentation/manager/register_cubit.dart';
import '../../features/auth/reset_pass/presentation/manager/reset_pass_cubit.dart';
import '../../features/auth/verify_account/presentation/manager/verify_account_cubit.dart';

final di = GetIt.instance;

Future<void> init() async {
  /// Login
  di.registerFactory(() => LoginCubit(loginUseCase: di()));
  di.registerLazySingleton(() => LoginUseCase(loginRepo: di()));
  di.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(loginService:  di()));
  di.registerLazySingleton<LoginService>(() => LoginServiceImpl());

  /// Register
  di.registerFactory(() => RegisterCubit(registerUseCase: di()));
  di.registerLazySingleton(() => RegisterUseCase(registerRepo: di()));
  di.registerLazySingleton<RegisterRepo>(() => RegisterRepoImpl(registerService:  di()));
  di.registerLazySingleton<RegisterService>(() => RegisterServiceImpl());

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
