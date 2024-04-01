import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../core/utils/app_images.dart';
import '../core/utils/app_text_styles.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AppImages.wifiSvg,
              height: 135.h,
              width: 150.w,
            ),
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
    );
  }
}
