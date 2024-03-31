import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/router/router.dart';
import '../../../../../core/shared/arguments.dart';
import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(20.h),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0.sp),
              child: ListTile(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 48.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                S.of(context).language,
                                textAlign: TextAlign.right,
                                style: CustomTextStyle.kTextStyleF16.copyWith(
                                    // color: AppColors.textColorSecondary,
                                    ),
                              ),
                              Gap(30.h),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    MyApp.setLocale(
                                        context, const Locale("en"));
                                  });
                                  context.pop();
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      MdiIcons.alphaE,
                                      size: 16.sp,
                                    ),
                                    Gap(10.w),
                                    Text(
                                      'English - EN',
                                      style: CustomTextStyle.kTextStyleF14,
                                    ),
                                    const Spacer(),
                                    Intl.getCurrentLocale() == "en"
                                        ? Icon(
                                            Icons.check,
                                            color: AppColors.successColor,
                                            size: 16.sp,
                                            // color: AppColors.lightBlue,
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              ),
                              Gap(20.h),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    MyApp.setLocale(
                                        context, const Locale("ar"));
                                  });
                                  context.pop();
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      MdiIcons.abjadArabic,
                                      size: 16.sp,
                                    ),
                                    Gap(10.w),
                                    const Text(
                                      'العربية - AR',
                                    ),
                                    const Spacer(),
                                    Intl.getCurrentLocale() == "ar"
                                        ? Icon(
                                            Icons.check,
                                            color: AppColors.successColor,
                                            size: 16.sp,
                                            // color: AppColors.lightBlue,
                                          )
                                        : const SizedBox.shrink(),
                                    // Icon(Icons.check,size: 16.sp,color: AppColors.lightBlue,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                title: Opacity(
                  opacity: 0.90,
                  child: Text(
                    S.of(context).language,
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  // color: AppColors.lightBlue,
                  size: 16.sp,
                ),
              ),
            ),
            Gap(10.h),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0.sp),
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        insetPadding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.p16,
                            vertical: Dimensions.p16),
                        title: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              MdiIcons.chevronRight,
                            ),
                            Text(
                              S.of(context).privacyPolicy,
                              style: CustomTextStyle.kTextStyleF20,
                            )
                          ],
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).privacyDes,
                              style: CustomTextStyle.kTextStyleF16,
                            ),
                          ],
                        ),
                        contentTextStyle: CustomTextStyle.kTextStyleF14,
                      );
                    },
                  );
                },
                title: Opacity(
                  opacity: 0.90,
                  child: Text(
                    S.of(context).privacyPolicy,
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  // color: AppColors.lightBlue,
                  size: 16.sp,
                ),
              ),
            ),
            Gap(10.h),
            // Container(
            //   color: Colors.white,
            //   padding: EdgeInsets.all(16.0.sp),
            //   child: ListTile(
            //     onTap: () {
            //       // context.pushNamed(contactUsPageRoute);
            //     },
            //     title: Opacity(
            //       opacity: 0.90,
            //       child: Text(
            //         S.of(context).contactUs,
            //         style: CustomTextStyle.kTextStyleF16,
            //       ),
            //     ),
            //     trailing: Icon(
            //       Icons.arrow_forward_ios_sharp,
            //       // color: AppColors.lightBlue,
            //       size: 16.sp,
            //     ),
            //   ),
            // ),
            // Gap(10.h),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0.sp),
              child: ListTile(
                onTap: () {
                  context.pushNamed(ordersPageRoute);
                },
                title: Opacity(
                  opacity: 0.90,
                  child: Text(
                    S.of(context).orders,
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  // color: AppColors.lightBlue,
                  size: 16.sp,
                ),
              ),
            ),
            Gap(10.h),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0.sp),
              child: ListTile(
                onTap: () {
                  context.pushNamed(
                    savedAddressesPageRoute,
                    arguments: AddressArgs(
                      latLng: const LatLng(0, 0),
                      address: const Placemark(),
                    ),
                  );
                },
                title: Opacity(
                  opacity: 0.90,
                  child: Text(
                    S.of(context).savedAddresses,
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  // color: AppColors.lightBlue,
                  size: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
