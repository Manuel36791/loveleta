import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/auth/login/presentation/manager/login_cubit.dart';
import '../../feature/auth/register/presentation/manager/register_cubit.dart';

final di = GetIt.instance;

Future<void> init() async {

  /// Login
  di.registerFactory(() => LoginCubit());

  /// Register
  di.registerFactory(() => RegisterCubit());

  /// UseCases

  /// Repos

  /// Services


  /// external
  final sharedPrefs = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPrefs);
}
