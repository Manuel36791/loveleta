import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loveleta/core/utils/extensions.dart';

import '../../utils/app_images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  const CustomAppBar({
    super.key,
    required this.context,
  });

  @override
  Size get preferredSize => Size(context.queryWidth.w, 60.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                AppImages.settingsSvg,
                width: 25.w,
                height: 25.h,
              ),
            ),
            SvgPicture.asset(
              AppImages.appLogoSvg,
              width: 38.w,
              height: 50.h,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                AppImages.bagSvg,
                width: 25.w,
                height: 25.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
