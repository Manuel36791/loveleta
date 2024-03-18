import 'package:bloc/bloc.dart';

import 'logger.dart';

///   Bloc.observer = AppCubitObserver(); -> add to Void() main{}

class AppCubitObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.i('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.w('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.f('fatalLog: onError -- ${bloc.runtimeType}',
        error: error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.i('onClose -- ${bloc.runtimeType}');
  }
}
