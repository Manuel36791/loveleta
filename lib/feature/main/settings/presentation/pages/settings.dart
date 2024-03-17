import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';

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
                                "Language",
                                textAlign: TextAlign.right,
                                style: CustomTextStyle.kTextStyleF16.copyWith(
                                  // color: AppColors.textColorSecondary,
                                ),
                              ),
                              Gap(30.h),
                              GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   MyApp.setLocale(
                                  //       context, const Locale("en"));
                                  // });
                                  //
                                  // CacheHelper.setAppLanguage('en');
                                  // context.pushNamed(bottomNavBarPageRoute);
                                },
                                child: Row(
                                  children: [
                                    Text('English - EN',
                                        style: CustomTextStyle.kTextStyleF14
                                            ,),
                                    const Spacer(),
                                    Icon(
                                            Icons.check,
                                            size: 16.sp,
                                            // color: AppColors.lightBlue,
                                          )

                                  ],
                                ),
                              ),
                              Gap(20.h),
                              GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   MyApp.setLocale(
                                  //       context, const Locale("ar"));
                                  // });
                                  // CacheHelper.setAppLanguage('ar');
                                  // context.pushNamed(bottomNavBarPageRoute);
                                },
                                child: Row(
                                  children: [
                                    Text('العربية - AR',),
                                    const Spacer(),
                                    Icon(
                                            Icons.check,
                                            size: 16.sp,
                                            // color: AppColors.lightBlue,
                                          ),
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
                    "Language",
                    style: CustomTextStyle.kTextStyleF16
                        ,
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
                  // context.pushNamed(notificationsPageRoute);
                },
                title: Opacity(
                  opacity: 0.90,
                  child: Text(
                    "Notifications",
                    style: CustomTextStyle.kTextStyleF16
                        ,
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
                              "Privacy Policy",
                              style: CustomTextStyle.kTextStyleF20,
                            )
                          ],
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Our privacy policy describes how we collect and process your personal information, such as the information you provide through our application. The policy also outlines your rights regarding your personal information, how it is retained, and secured. Communication: Various communication channels are provided in case of any questions or inquiries about the privacy policy. You can speak to the team through the application, call the specified number, or contact them via email.Updates: In the event of any changes in the way personal information is processed or in the policy itself, you will be promptly notified via email and the application will be updated.",
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
                    "Privacy Policy",
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
                  // context.pushNamed(contactUsPageRoute);
                },
                title: Opacity(
                  opacity: 0.90,
                  child: Text(
                    "Contact Us",
                    style: CustomTextStyle.kTextStyleF16
                        ,
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
