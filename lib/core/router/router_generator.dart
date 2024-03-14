import 'package:flutter/material.dart';
import 'package:loveleta/feature/auth/reset_pass/presentation/pages/reset_pass_view.dart';

import '../../feature/auth/forgot_pass/presentation/pages/forgot_pass_view.dart';
import '../../feature/auth/login/presentation/pages/login_view.dart';
import '../../feature/auth/register/presentation/pages/register_view.dart';
import '../../feature/auth/verify_account/presentation/pages/verify_account_view.dart';
import '../../main_view.dart';
import 'router.dart';

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
      case verifyAccountPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const VerifyAccountView(),
        );
      case forgotPassPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ForgotPassView(),
        );
        case resetPassPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ResetPassView(),
        );

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MainView(),
        );
    }
  }
}
