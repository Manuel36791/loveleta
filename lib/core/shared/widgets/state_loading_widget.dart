import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../utils/app_colors.dart';

class StateLoadingWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const StateLoadingWidget({super.key, this.height,  this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(30.h),
        Center(
          child: SizedBox(
            height: height ?? 100.h,
            width: width ?? 100.w,
            child: const CircularProgressIndicator(
              color: AppColors.pinkPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
