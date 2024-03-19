import 'package:flutter/material.dart';
import 'package:loveleta/feature/orders/order_details/presentation/pages/order_details.dart';

import '../../feature/auth/change_password/presentation/pages/change_pass_view.dart';
import '../../feature/auth/forgot_pass/presentation/pages/forgot_pass_view.dart';
import '../../feature/auth/login/presentation/pages/login_view.dart';
import '../../feature/auth/register/presentation/pages/register_view.dart';
import '../../feature/auth/reset_pass/presentation/pages/reset_pass_view.dart';
import '../../feature/auth/verify_account/presentation/pages/verify_account_view.dart';
import '../../feature/bottom_nav_bar/bottom_nav_bar.dart';
import '../../feature/main/categories/presentation/pages/categories_view.dart';
import '../../feature/main/category_products/presentation/pages/category_details.dart';
import '../../feature/main/home/presentation/pages/home_view.dart';
import '../../feature/main/product_details/presentation/pages/product_details_view.dart';
import '../../feature/main/settings/presentation/pages/settings.dart';
import '../../feature/orders/track_order/presentation/pages/track_order_view.dart';
import '../../feature/orders/user_orders/presentation/pages/user_orders_view.dart';
import '../../main_view.dart';
import 'router.dart';

class AppRouters {
  static Route routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      /// Bottom Navigation Bar
      case bottomNavBar:
        return MaterialPageRoute(
          builder: (BuildContext context) => const BottomNavBar(),
        );

      /// Auth Routes
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
      case changePassPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ChangePassView(),
        );

      /// Main Routes
      case homePageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeView(),
        );
      case productDetailsPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ProductDetailsView(),
        );
      case categoriesPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const CategoriesView(),
        );
      case settingsPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SettingsView(),
        );
      case categoryProductsPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const CategoryProductsView(),
        );

      /// Orders Routes
      case ordersPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const OrdersView(),
        );
      case orderDetailsPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const OrderDetailsView(),
        );
      case trackOrderPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const TrackOrderView(),
        );

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MainView(),
        );
    }
  }
}
