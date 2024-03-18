import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/dimensions.dart';

class CartItem extends StatefulWidget {
  final int itemIndex;
  final String productName;
  final String productPrice;
  final String productImage;
  final String categoryName;
  final int quantity;

  const CartItem({
    super.key,
    required this.itemIndex,
    required this.productImage,
    required this.productName,
    required this.categoryName,
    required this.productPrice,
    required this.quantity,

  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<int>(widget.itemIndex),
      onDismissed: (value) {},
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.all(Dimensions.p16),
        decoration: BoxDecoration(
          color: AppColors.errorColor,
          borderRadius: BorderRadius.circular(Dimensions.r15),
        ),
        child: Align(
          alignment: Intl.getCurrentLocale() == "en"
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Icon(
            MdiIcons.deleteEmpty,
            size: 32.sp,
          ),
        ),
      ),
      // onDismissed: (direction) {
      //   setState(() {});
      // },
      child: GFListTile(
        shadow: const BoxShadow(),
        color: Colors.white,
        avatar: GFAvatar(
          size: 60.sp,
          shape: GFAvatarShape.standard,
          backgroundImage: CachedNetworkImageProvider(
            widget.productImage,
          ),
        ),
        title: Text(
          widget.productName,
          style: CustomTextStyle.kTextStyleF12,
        ),
        subTitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.categoryName,
              style: CustomTextStyle.kTextStyleF12
                  .copyWith(color: AppColors.textGrey),
            ),
          ],
        ),
        description: Row(
          children: [
            Text(widget.productPrice, style: CustomTextStyle.kTextStyleF14),
            const Spacer(),
            GestureDetector(
              onTap: () {
                // setState(() {
                //   if (productItems
                //       .userQuantity! <=
                //       productItems.quantity!) {
                //     productItems.userQuantity =
                //         productItems
                //             .userQuantity! +
                //             1;
                //   }
                // });
              },
              child: Icon(
                MdiIcons.plusBoxOutline,
                color: AppColors.pinkPrimary,
              ),
            ),
            Gap(10.w),
            Text(widget.quantity.toString(),
                style: CustomTextStyle.kTextStyleF14.copyWith(
                  fontWeight: FontWeight.w700,
                )),
            Gap(10.w),
            GestureDetector(
              onTap: () {
                // setState(() {
                //   if (productItems
                //       .userQuantity! >=
                //       1) {
                //     productItems.userQuantity =
                //         productItems
                //             .userQuantity! -
                //             1;
                //   }
                // });
              },
              child: Icon(
                MdiIcons.minusBoxOutline,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
