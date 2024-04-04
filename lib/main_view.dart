import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loveleta/core/utils/extensions.dart';

import 'core/dependency_injection/di.dart' as di;
import 'core/router/router.dart';
import 'core/shared/arguments.dart';
import 'core/shared/cubits/internet_checker_cubit.dart';
import 'core/utils/app_colors.dart';
import 'features/auth/login/presentation/manager/login_cubit.dart';
import 'features/no_internet_view.dart';
import 'generated/l10n.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(),
        ),
        BlocProvider(
          create: (context) => di.di<LoginCubit>(),
        ),
      ],
      child: BlocConsumer<InternetCubit, InternetStates>(
        listener: (context, state) {
          LoginCubit loginCubit = LoginCubit.get(context);
          if (state == InternetStates.gained) {
            loginCubit.rememberMe(context);
          }
        },
        builder: (context, state) {
          return BlocConsumer<LoginCubit, LoginStates>(
            listener: (context, loginState) {

              loginState.maybeWhen(
                success: (state) async {
                  if (state.status == 1) {
                    context.pushNamed(bottomNavBar);
                  } else if (state.status == 0 &&
                      state.msg ==
                          "Active your account first verification code sent to your email !") {
                    context.pushNamed(
                      verifyAccountPageRoute,
                      arguments: VerifyAccountArgs(email: state.email!),
                    );
                  } else {
                    context.pushNamed(loginPageRoute);
                  }
                },
                error: (errCode, err) {
                  context.defaultSnackBar(
                    S.of(context).error(errCode, err),
                    color: AppColors.errorColor,
                  );
                },
                orElse: () {},
              );
            },
            builder: (context, loginState) {
              return state == InternetStates.gained
                  ? Image.asset("assets/images/splash.png", fit: BoxFit.fitWidth,)
                  : const NoInternetView();
            },
          );
        },
      ),
    );
  }
}
