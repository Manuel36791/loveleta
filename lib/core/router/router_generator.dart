import 'package:flutter/material.dart';

import '../../features/address/add_new_address/presentation/pages/add_new_address_view.dart';
import '../../features/address/map/presentation/pages/map_view.dart';
import '../../features/address/saved_addresses/presentation/pages/saved_addresses_view.dart';
import '../../features/auth/change_password/presentation/pages/change_pass_view.dart';
import '../../features/auth/forgot_pass/presentation/pages/forgot_pass_view.dart';
import '../../features/auth/login/presentation/pages/login_view.dart';
import '../../features/auth/register/presentation/pages/register_view.dart';
import '../../features/auth/reset_pass/presentation/pages/reset_pass_view.dart';
import '../../features/auth/verify_account/presentation/pages/verify_account_view.dart';
import '../../features/bottom_nav_bar/bottom_nav_bar.dart';
import '../../features/main/categories/presentation/pages/categories_view.dart';
import '../../features/main/category_products/presentation/pages/category_details.dart';
import '../../features/main/home/presentation/pages/home_view.dart';
import '../../features/main/product_details/presentation/pages/product_details_view.dart';
import '../../features/main/settings/presentation/pages/settings.dart';
import '../../features/orders/order_details/presentation/pages/order_details.dart';
import '../../features/orders/track_order/presentation/pages/track_order_view.dart';
import '../../features/orders/user_orders/presentation/pages/user_orders_view.dart';
import '../../main_view.dart';
import '../shared/arguments.dart';
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
        final args = settings.arguments as ChangePassArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => VerifyAccountView(
            email: args.email,
          ),
        );
      case forgotPassPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ForgotPassView(),
        );
      case resetPassPageRoute:
        final args = settings.arguments as ResetPassArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => ResetPassView(
            email: args.email,
          ),
        );
      case changePassPageRoute:
        final args = settings.arguments as ChangePassArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => ChangePassView(
            email: args.email,
          ),
        );

      /// Main Routes
      case homePageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeView(),
        );
      case productDetailsPageRoute:
        final args = settings.arguments as ProductDetailsArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductDetailsView(
            product: args.product,
          ),
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

      /// Address Routes
      case savedAddressesPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SavedAddressesView(),
        );
      case addNewAddressPageRoute:
        final args = settings.arguments as AddressArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => AddNewAddressView(
            address: args.address,
            latLng: args.latLng,
          ),
        );
      case mapPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MapView(),
        );

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MainView(),
        );
    }
  }
}
