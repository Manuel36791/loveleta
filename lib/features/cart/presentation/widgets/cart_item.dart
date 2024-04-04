import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../core/shared/cubits/cart_cubit/cart_cubit.dart';
import '../../../../core/shared/entities/product_entity.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/dimensions.dart';

class CartItem extends StatefulWidget {
  final ProductEntity product;

  const CartItem({
    super.key,
    required this.product,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<int>(widget.product.id!.toInt()),
      onDismissed: (value) {
        context.read<CartCubit>().removeFromCart(widget.product);
      },
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
            widget.product.mainImage!,
          ),
        ),
        title: Text(
          Intl.getCurrentLocale() == "en"
              ? widget.product.nameEn!
              : widget.product.nameAr!,
          style: CustomTextStyle.kTextStyleF12,
        ),
        description: Row(
          children: [
            Text(widget.product.price.toString(),
                style: CustomTextStyle.kTextStyleF14),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.product.userQty! <= widget.product.qty!) {
                    widget.product.userQty! + 1;
                  }
                });
              },
              child: Icon(
                MdiIcons.plusBoxOutline,
                color: AppColors.pinkPrimary,
              ),
            ),
            Gap(10.w),
            Text(widget.product.userQty.toString(),
                style: CustomTextStyle.kTextStyleF14.copyWith(
                  fontWeight: FontWeight.w700,
                )),
            Gap(10.w),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.product.userQty! >= 1) {
                    widget.product.userQty! - 1;
                  }
                });
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
