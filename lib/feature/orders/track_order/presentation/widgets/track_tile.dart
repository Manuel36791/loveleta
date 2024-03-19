import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';

class TrackTile extends StatelessWidget {
  final String? message;
  final String? date;
  const TrackTile({super.key, this.message, this.date,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: Dimensions.p16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(message!, style: CustomTextStyle.kTextStyleF14.copyWith(
                fontWeight: FontWeight.w700,
              ),),
              Text(
                DateTime.parse(
                  date!,
                ).stringFormat(
                    DateFormatType.dayMonthYearTime
                ),
                style: CustomTextStyle.kTextStyleF12.copyWith(
                  color: AppColors.textGrey,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: Dimensions.r15,
            backgroundColor: AppColors.pinkPrimary,
            child: Icon(MdiIcons.check),
          ),
        ],
      ),
    );
  }
}
