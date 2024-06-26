import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/change_password/data/data_sources/change_pass_service.dart';
import '../../features/auth/change_password/data/repositories/change_pass_repo_impl.dart';
import '../../features/auth/change_password/domain/repositories/change_pass_repo.dart';
import '../../features/auth/change_password/domain/use_cases/change_pass_usecase.dart';
import '../../features/auth/change_password/presentation/manager/change_pass_cubit.dart';
import '../../features/auth/forgot_pass/data/data_sources/forgot_pass_service.dart';
import '../../features/auth/forgot_pass/data/repositories/forget_pass_repo_impl.dart';
import '../../features/auth/forgot_pass/domain/repositories/forget_pass_repo.dart';
import '../../features/auth/forgot_pass/domain/use_cases/forget_pass_usecase.dart';
import '../../features/auth/forgot_pass/presentation/manager/forgot_pass_cubit.dart';
import '../../features/auth/login/data/data_sources/login_service.dart';
import '../../features/auth/login/data/repositories/login_repo_impl.dart';
import '../../features/auth/login/domain/repositories/login_repo.dart';
import '../../features/auth/login/domain/use_cases/login_use_case.dart';
import '../../features/auth/login/presentation/manager/login_cubit.dart';
import '../../features/auth/register/data/data_sources/register_service.dart';
import '../../features/auth/register/data/repositories/register_repo_impl.dart';
import '../../features/auth/register/domain/repositories/register_repo.dart';
import '../../features/auth/register/domain/use_cases/register_usecase.dart';
import '../../features/auth/register/presentation/manager/register_cubit.dart';
import '../../features/auth/reset_pass/data/data_sources/resend_code_service.dart';
import '../../features/auth/reset_pass/data/data_sources/reset_pass_service.dart';
import '../../features/auth/reset_pass/data/repositories/reset_pass_repo_impl.dart';
import '../../features/auth/reset_pass/domain/repositories/reset_pass_repo.dart';
import '../../features/auth/reset_pass/domain/use_cases/reset_pass_usecase.dart';
import '../../features/auth/reset_pass/presentation/manager/reset_pass_cubit.dart';
import '../../features/auth/verify_account/data/data_sources/resend_code_service.dart';
import '../../features/auth/verify_account/data/data_sources/verify_account_service.dart';
import '../../features/auth/verify_account/data/repositories/verify_account_repo_impl.dart';
import '../../features/auth/verify_account/domain/repositories/verify_account_repo.dart';
import '../../features/auth/verify_account/domain/use_cases/resend_code_usecase.dart';
import '../../features/auth/verify_account/domain/use_cases/verify_account_usecase.dart';
import '../../features/auth/verify_account/presentation/manager/verify_account_cubit.dart';
import '../../features/main/categories/data/data_sources/category_service.dart';
import '../../features/main/categories/data/repository/category_repo_impl.dart';
import '../../features/main/categories/domain/repository/category_repo.dart';
import '../../features/main/favorite/data/data_sources/favorite_service.dart';
import '../../features/main/favorite/data/repositories/favorite_repo_impl.dart';
import '../../features/main/favorite/domain/repositories/favorite_repo.dart';
import '../../features/main/favorite/domain/use_cases/favorite_use_case.dart';
import '../../features/main/favorite/presentation/manager/favorite_cubit.dart';
import '../../features/main/home/data/data_sources/best_seller_service.dart';
import '../../features/main/home/data/data_sources/new_products_service.dart';
import '../../features/main/home/data/data_sources/products_by_category_service.dart';
import '../../features/main/home/data/repository/best_seller_repo_impl.dart';
import '../../features/main/home/data/repository/new_products_repo_impl.dart';
import '../../features/main/home/data/repository/products_by_category_repo_impl.dart';
import '../../features/main/home/domain/repository/best_seller_repo.dart';
import '../../features/main/home/domain/repository/new_products_repo.dart';
import '../../features/main/home/domain/repository/products_by_category.dart';
import '../../features/main/home/domain/usecases/best_seller_ucse_case.dart';
import '../../features/main/home/domain/usecases/new_products_use_case.dart';
import '../../features/main/home/domain/usecases/products_by_category_use_case.dart';
import '../../features/main/categories/domain/usecases/category_use_case.dart';
import '../../features/main/categories/presentation/manager/category_cubit.dart';
import '../../features/main/home/presentation/manager/best_seller_cubit/best_seller_cubit.dart';
import '../../features/main/home/presentation/manager/new_products_cubit/new_products_cubit.dart';
import '../../features/main/home/presentation/manager/products_by_category/products_by_category_cubit.dart';
import '../../features/main/product_details/data/data_sources/add_product_to_favorites_service.dart';
import '../../features/main/product_details/data/data_sources/check_if_product_is_favorite_service.dart';
import '../../features/main/product_details/data/repositories/add_favorite_repo_impl.dart';
import '../../features/main/product_details/domain/repository/favorite_product_repo.dart';
import '../../features/main/product_details/domain/use_cases/add_product_to_favorites_use_case.dart';
import '../../features/main/product_details/domain/use_cases/check_if_product_is_favorite_use_case.dart';
import '../../features/main/product_details/presentation/add_to_favortes_cubit/add_to_favorites_cubit.dart';
import '../../features/main/product_details/presentation/check_if_favorite_cubit/check_if_favorite_cubit.dart';
import '../../features/main/subcategory_products/data/data_sources/subcategory_products_service.dart';
import '../../features/main/subcategory_products/data/repository/subcategory_products_repo_impl.dart';
import '../../features/main/subcategory_products/domain/repository/subcategory_products_repo.dart';
import '../../features/main/subcategory_products/domain/usecases/subcategory_products_usecase.dart';
import '../../features/main/subcategory_products/presentation/manager/subcategory_products_cubit.dart';
import '../../features/main/update_profile/data/data_sources/delete_account_service.dart';
import '../../features/main/update_profile/data/data_sources/update_profile_service.dart';
import '../../features/main/update_profile/data/repositories/update_profile_repo_impl.dart';
import '../../features/main/update_profile/domain/repositories/update_profile_repo.dart';
import '../../features/main/update_profile/domain/use_cases/delete_account_use_case.dart';
import '../../features/main/update_profile/domain/use_cases/update_profile_use_case.dart';
import '../../features/main/update_profile/presentation/manager/edit_profile_cubit.dart';
import '../../features/orders/track_order/data/data_sources/cancel_order_service.dart';
import '../../features/orders/track_order/data/repositories/cancel_order_repo_impl.dart';
import '../../features/orders/track_order/domain/repositories/cancel_order_repo.dart';
import '../../features/orders/track_order/domain/use_cases/cancel_order_usecase.dart';
import '../../features/orders/track_order/presentation/manager/cancel_order_cubit.dart';
import '../../features/orders/user_orders/data/data_sources/user_orders_service.dart';
import '../../features/orders/user_orders/data/repositories/user_orders_repo_impl.dart';
import '../../features/orders/user_orders/domain/repositories/user_orders_repo.dart';
import '../../features/orders/user_orders/domain/use_cases/user_orders_usecase.dart';
import '../../features/orders/user_orders/presentation/manager/user_orders_cubit.dart';
import '../../features/payment_summary/data/data_sources/place_order_service.dart';
import '../../features/payment_summary/data/repositories/place_order_repo_impl.dart';
import '../../features/payment_summary/domain/repositories/place_order_repo.dart';
import '../../features/payment_summary/domain/use_cases/place_order_use_case.dart';
import '../../features/payment_summary/presentation/manager/place_order_cubit.dart';

final di = GetIt.instance;

Future<void> init() async {
  /// Login
  di.registerFactory(() => LoginCubit(loginUseCase: di()));
  di.registerLazySingleton(() => LoginUseCase(loginRepo: di()));
  di.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(loginService: di()));
  di.registerLazySingleton<LoginService>(() => LoginServiceImpl());

  /// Register
  di.registerFactory(() => RegisterCubit(registerUseCase: di()));
  di.registerLazySingleton(() => RegisterUseCase(registerRepo: di()));
  di.registerLazySingleton<RegisterRepo>(
      () => RegisterRepoImpl(registerService: di()));
  di.registerLazySingleton<RegisterService>(() => RegisterServiceImpl());

  /// Verify Account
  di.registerFactory(() =>
      VerifyAccountCubit(verifyAccountUseCase: di(), resendCodeUseCase: di()));
  di.registerLazySingleton(() => VerifyAccountUseCase(verifyAccountRepo: di()));
  di.registerLazySingleton(
      () => VerifyResendCodeUseCase(verifyAccountRepo: di()));
  di.registerLazySingleton<VerifyAccountRepo>(() => VerifyAccountRepoImpl(
        verifyAccountService: di(),
        resendCodeService: di(),
      ));
  di.registerLazySingleton<VerifyAccountService>(
      () => VerifyAccountServiceImpl());
  di.registerLazySingleton<VerifyResendCodeService>(
      () => VerifyResendCodeServiceImpl());

  /// Forgot Password
  di.registerFactory(() => ForgotPassCubit(forgotPassUseCase: di()));
  di.registerLazySingleton(() => ForgotPassUseCase(forgotPassRepo: di()));
  di.registerLazySingleton<ForgotPassRepo>(
      () => ForgotPassRepoImpl(forgotPassService: di()));
  di.registerLazySingleton<ForgotPassService>(() => ForgotPassServiceImpl());

  /// Reset Password
  di.registerFactory(
      () => ResetPassCubit(resetPassUseCase: di(), resendCodeUseCase: di()));
  di.registerLazySingleton(() => ResetPassUseCase(resetPassRepo: di()));
  di.registerLazySingleton<ResetPassRepo>(
      () => ResetPassRepoImpl(resetPassService: di(), resendCodeService: di()));
  di.registerLazySingleton<ResetPassService>(() => ResetPassServiceImpl());
  di.registerLazySingleton<ResendCodeService>(() => ResendCodeServiceImpl());

  /// Change Password
  di.registerFactory(() => ChangePassCubit(changePassUseCase: di()));
  di.registerLazySingleton(() => ChangePassUseCase(changePassRepo: di()));
  di.registerLazySingleton<ChangePassRepo>(() => ChangePassRepoImpl(
        changePassService: di(),
      ));
  di.registerLazySingleton<ChangePassService>(() => ChangePassServiceImpl());

  /// Categories
  di.registerFactory(() => CategoryCubit(categoryUseCase: di()));
  di.registerLazySingleton(() => CategoryUseCase(categoryRepo: di()));
  di.registerLazySingleton<CategoryRepo>(
      () => CategoryRepoImpl(categoryService: di()));
  di.registerLazySingleton<CategoryService>(() => CategoryServiceImpl());

  /// Products by SubCategory
  di.registerFactory(
      () => SubCategoryProductsCubit(categoryProductsUseCase: di()));
  di.registerLazySingleton(
      () => SubCategoryProductsUseCase(categoryProductsRepo: di()));
  di.registerLazySingleton<SubCategoryProductsRepo>(
      () => SubCategoryProductsRepoImpl(categoryService: di()));
  di.registerLazySingleton<SubCategoryProductsService>(
      () => SubCategoryProductsServiceImpl());

  /// Products by Category
  di.registerFactory(() => ProductsByCategoryCubit(productsUseCase: di()));
  di.registerLazySingleton(
      () => ProductsByCategoryUseCase(productsByCategoryRepo: di()));
  di.registerLazySingleton<ProductsByCategoryRepo>(
      () => ProductsByCategoryRepoImpl(productsService: di()));
  di.registerLazySingleton<ProductsByCategoryService>(
      () => ProductsByCategoryServiceImpl());

  /// New Arrivals
  di.registerFactory(() => NewProductsCubit(newProductsUseCase: di()));
  di.registerLazySingleton(() => NewProductsUseCase(newProductsRepo: di()));
  di.registerLazySingleton<NewProductsRepo>(
      () => NewProductsRepoImpl(productsService: di()));
  di.registerLazySingleton<NewProductsService>(() => NewProductsServiceImpl());

  /// Best Sellers
  di.registerFactory(() => BestSellerCubit(bestSellerRepo: di()));
  di.registerLazySingleton(() => BestSellerUseCase(bestSellerRepo: di()));
  di.registerLazySingleton<BestSellerRepo>(
      () => BestSellerRepoImpl(productsService: di()));
  di.registerLazySingleton<BestSellerService>(() => BestSellerServiceImpl());

  /// Orders
  di.registerFactory(() => UserOrdersCubit(userOrdersUseCase: di()));
  di.registerLazySingleton(() => UserOrdersUseCase(userOrdersRepo: di()));
  di.registerLazySingleton<UserOrdersRepo>(
      () => UserOrdersRepoImpl(userOrdersService: di()));
  di.registerLazySingleton<UserOrdersService>(() => UserOrdersServiceImpl());

  /// Cancel Order
  di.registerFactory(() => CancelOrderCubit(cancelOrderUseCase: di()));
  di.registerLazySingleton(() => CancelOrderUseCase(cancelOrderRepo: di()));
  di.registerLazySingleton<CancelOrderRepo>(
      () => CancelOrderRepoImpl(cancelOrderService: di()));
  di.registerLazySingleton<CancelOrderService>(() => CancelOrderServiceImpl());

  /// Place Order
  di.registerFactory(() => PlaceOrderCubit(placeOrderUseCase: di()));
  di.registerLazySingleton(() => PlaceOrderUseCase(placeOrderRepo: di()));
  di.registerLazySingleton<PlaceOrderRepo>(
      () => PlaceOrderRepoImpl(placeOrderService: di()));
  di.registerLazySingleton<PlaceOrderService>(() => PlaceOrderServiceImpl());

  /// Update & Delete Profile
  di.registerFactory(() =>
      EditProfileCubit(editProfileUseCase: di(), deleteAccountUseCase: di()));
  di.registerLazySingleton(() => UpdateProfileUseCase(editProfileRepo: di()));
  di.registerLazySingleton(() => DeleteAccountUseCase(editProfileRepo: di()));
  di.registerLazySingleton<UpdateProfileRepo>(() => UpdateProfileRepoImpl(
      updateProfileService: di(), deleteAccountService: di()));
  di.registerLazySingleton<UpdateProfileService>(() => UpdateProfileServiceImpl());
  di.registerLazySingleton<DeleteAccountService>(
      () => DeleteAccountServiceImpl());

  /// Favorites
  di.registerFactory(() => FavoriteCubit(favoriteUseCase: di()));
  di.registerLazySingleton(() => FavoriteUseCase(favoriteRepo: di()));
  di.registerLazySingleton<FavoriteRepo>(
          () => FavoriteRepoImpl(favoriteService: di()));
  di.registerLazySingleton<FavoriteService>(() => FavoriteServiceImpl());

  /// Add To Favorites & Check if it's Favorite
  di.registerFactory(() => AddToFavoritesCubit(addToFavoriteUseCase: di()));
  di.registerFactory(() => CheckIfFavoriteCubit(checkIfFavoriteUseCase: di()));
  di.registerLazySingleton(() => AddProductToFavoritesUseCase(addFavoriteRepo: di()));
  di.registerLazySingleton(() => CheckIfProductIsFavoriteUseCase(checkIfProductIsFavoriteRepo: di()));
  di.registerLazySingleton<FavoriteProductRepo>(() => FavoriteProductRepoImpl(addProductToFavoriteService: di(), checkIfProductIsFavoriteService: di()));
  di.registerLazySingleton<AddProductToFavoriteService>(() => AddProductToFavoriteServiceImpl());
  di.registerLazySingleton<CheckIfProductIsFavoriteService>(() => CheckIfProductIsFavoriteServiceImpl());

  /// external
  final sharedPrefs = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPrefs);
}
