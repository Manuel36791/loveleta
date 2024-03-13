import 'package:flutter/material.dart';
import 'package:loveleta/core/router/router.dart';

import '../../feature/auth/login/presentation/pages/login_view.dart';
import '../../feature/auth/register/presentation/pages/register_view.dart';
import '../../main_view.dart';

class AppRouters {
  static Route routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case loginPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginView(),
        );
      case registerPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const RegisterView(),
        );


      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MainView(),
        );
    }
  }
}
