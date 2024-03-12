import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'core/shared/cubits/internet_checker_cubit.dart';
import 'core/utils/app_text_styles.dart';
import 'core/utils/app_images.dart';
import 'feature/auth/login/presentation/pages/login_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: BlocConsumer<InternetCubit, InternetStates>(
        listener: (context, state) {
          // if (state == InternetStates.gained) {
          // } else if (state == InternetStates.lost) {
          //   context.defaultSnackBar(
          //     "No Internet Connection",
          //     color: AppColors.errorColor,
          //   );
          // }
        },
        builder: (context, state) {
          return state == InternetStates.lost
              ? Scaffold(
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppImages.wifiSvg,
                        height: 135.h,
                        width: 150.w,
                      ),
                      Gap(20.h),
                      Text(
                        "No Internet Connection",
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.kTextStyleF18,
                      ),
                      Gap(10.h),
                      Text(
                        "Make sure your phone is connected to the Internet",
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.kTextStyleF14,
                      ),
                    ],
                  ),
                )
              : const LoginView();

        },
      ),
    );
  }

// rememberMe(String email, String pass) async {
//   String email = await CacheHelper.getData("email");
//   String pass = await CacheHelper.getData("pass");
//
//
// }
}
