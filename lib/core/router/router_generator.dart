import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
import '../../features/cart/presentation/pages/cart_view.dart';
import '../../features/main/categories/domain/entities/category_entity.dart';
import '../../features/main/categories/presentation/pages/categories_view.dart';
import '../../features/main/categories/presentation/pages/subcategories_view.dart';
import '../../features/main/favorite/domain/entities/favorite_entity.dart';
import '../../features/main/favorite/presentation/manager/favorite_cubit.dart';
import '../../features/main/favorite/presentation/pages/favorite_view.dart';
import '../../features/main/home/presentation/manager/best_seller_cubit/best_seller_cubit.dart';
import '../../features/main/home/presentation/manager/new_products_cubit/new_products_cubit.dart';
import '../../features/main/home/presentation/manager/products_by_category/products_by_category_cubit.dart';
import '../../features/main/home/presentation/pages/best_seller_see_more_view.dart';
import '../../features/main/home/presentation/pages/new_products_see_more_view.dart';
import '../../features/main/product_details/presentation/pages/product_details_view.dart';
import '../../features/main/search/presentation/pages/search_view.dart';
import '../../features/main/see_more/presentation/pages/see_more_view.dart';
import '../../features/main/subcategory_products/presentation/pages/category_details.dart';
import '../../features/main/home/presentation/pages/home_view.dart';
import '../../features/main/settings/presentation/pages/settings.dart';
import '../../features/main/update_profile/presentation/pages/edit_profile_view.dart';
import '../../features/orders/order_details/presentation/pages/order_details.dart';
import '../../features/orders/track_order/presentation/pages/track_order_view.dart';
import '../../features/orders/user_orders/presentation/pages/user_orders_view.dart';
import '../../features/payment_summary/presentation/pages/order_summary_view.dart';
import '../../main_view.dart';
import '../dependency_injection/di.dart' as di;
import '../shared/arguments.dart';
import '../shared/models/user_data_model.dart';
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

      case newProductsPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => di.di<NewProductsCubit>()..getNewProducts(1),
            child: const NewProductsSeeMoreView(),
          ),
        );
      case bestSellerPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => di.di<BestSellerCubit>()..getBestSellers(1),
            child: const BestSellerSeeMoreView(),
          ),
        );
      case seeMorePageRoute:
        final args = settings.arguments as SeeMoreArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => di.di<ProductsByCategoryCubit>()
              ..getProductsByCategory(
                CategoryEntity(
                  id: args.id,
                  nextPage: 1,
                ),
              ),
            child: SeeMoreView(
              id: args.id!,
            ),
          ),
        );
      case categoriesPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const CategoriesView(),
        );
      case subCategoriesPageRoute:
        final args = settings.arguments as SubCategoryArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => SubCategoriesView(
            subcategories: args.subCategories,
          ),
        );
      case settingsPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SettingsView(),
        );
      case categoryProductsPageRoute:
        final args = settings.arguments as CategoryProductsArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => SubCategoryProductsView(
            id: args.id,
          ),
        );
      case productDetailsPageRoute:
        final args = settings.arguments as ProductDetailsArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductDetailsView(
            product: args.product,
          ),
        );
      case updateProfilePageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const UpdateProfileView(),
        );
      case favoritesPageRoute:
        return  MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => di.di<FavoriteCubit>()
              ..getAllFavorites(FavoriteEntity(
                userId: UserData.id,
                page: 1,
              )),
            child: const FavoriteView(),
          ),
        );

      /// Cart Routes
      case cartViewPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const CartView(),
        );
      case paymentSummaryPageRoute:
        final args = settings.arguments as PaymentSummaryArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              OrderSummaryView(address: args.address),
        );

      /// Orders Routes
      case ordersPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const OrdersView(),
        );
      case orderDetailsPageRoute:
        final args = settings.arguments as OrderDetailsArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => OrderDetailsView(
            orderDetails: args.orderDetails,
          ),
        );
      case trackOrderPageRoute:
        final args = settings.arguments as OrderDetailsArgs;
        return MaterialPageRoute(
          builder: (BuildContext context) => TrackOrderView(
            orderDetails: args.orderDetails,
          ),
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

        case searchPageRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SearchView(),
        );

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MainView(),
        );
    }
  }
}
