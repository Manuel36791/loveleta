import 'package:flutter/material.dart';
import 'package:loveleta/core/utils/extensions.dart';

import '../../utils/app_text_styles.dart';
import '../../utils/app_colors.dart';
import '../../utils/dimensions.dart';

class CustomBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isUpperCase;
  final double? borderRadius;
  final Color? bgColor;
  final Color? fgColor;

  const CustomBtn({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isUpperCase,
    this.borderRadius = Dimensions.r25,
    this.bgColor = AppColors.pinkPrimary,
    this.fgColor = AppColors.textWhite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(Dimensions.p16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: Text(
          isUpperCase
              ? label.isNullOrEmpty().toUpperCase()
              : label.isNullOrEmpty(),
          style: CustomTextStyle.kBtnTextStyle.copyWith(
            color: fgColor,
          ),
        ),
      ),
    );
  }
}
