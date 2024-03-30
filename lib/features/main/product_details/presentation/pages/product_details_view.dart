import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/shared/entities/product_entity.dart';
import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../generated/l10n.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailsView({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int qty = 1;
  int imageIndex = 0;

  String htmlEnContent = "";
  String htmlArContent = "";
  String cleanedHtmlArContent = "";
  String cleanedHtmlEnContent = "";

  formatDescription() {
    setState(
      (() {
        htmlEnContent = widget.product.descriptionEn!;
        cleanedHtmlEnContent = htmlEnContent.replaceAll(RegExp(r'<[^>]*>'), '');
        htmlArContent = widget.product.descriptionAr!;
        cleanedHtmlArContent = htmlArContent.replaceAll(RegExp(r'<[^>]*>'), '');
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    formatDescription();
  }

  @override
  Widget build(BuildContext context) {
    String selectedColor = widget.product.color![0];
    int selectedIndex = widget.product.color!.indexOf(selectedColor);
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.p16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.product.images![imageIndex].image!,
                        width: 312.w,
                        height: 312.h,
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            width: double.infinity,
                            height: 132.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    widget.product.images![imageIndex].image!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                            color: AppColors.pinkSecondary,
                            value: downloadProgress.progress,
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: AppColors.errorColor,
                        ),
                      ),
                      Positioned(
                        top: 10.h,
                        right: 10.w,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: Dimensions.r20,
                          child: Icon(
                            MdiIcons.heart,
                            size: 25.sp,
                            color: AppColors.textGrey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Gap(15.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        widget.product.images!.length,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.p5.w),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  imageIndex = index;
                                  print(imageIndex);
                                });
                              },
                              child: CachedNetworkImage(
                                imageUrl: widget.product.images![index].image!,
                                width: 60.w,
                                height: 60.h,
                                fit: BoxFit.cover,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    width: double.infinity,
                                    height: 132.h,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            widget.product.images![index].image!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.pinkSecondary,
                                    value: downloadProgress.progress,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error,
                                  color: AppColors.errorColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Gap(15.h),
                Text(
                  Intl.getCurrentLocale() == "en"
                      ? widget.product.nameEn!
                      : widget.product.nameAr!,
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(10.h),
                Html(
                  data: Intl.getCurrentLocale() == "en"
                      ? cleanedHtmlEnContent
                      : cleanedHtmlArContent,
                  style: {
                    "p": Style.fromTextStyle(
                      CustomTextStyle.kTextStyleF12,
                    ),
                    "div": Style.fromTextStyle(
                      CustomTextStyle.kTextStyleF12,
                    ),
                  },
                ),
                Gap(15.h),
                Text(
                  S.of(context).giftDetails,
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(10.h),
                Intl.getCurrentLocale() == "en"
                    ? SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.product.giftDetailsEn!.length,
                          itemBuilder: (ctx, index) {
                            return Text(
                              "• ${widget.product.giftDetailsEn![index]}",
                              style: CustomTextStyle.kTextStyleF12,
                            );
                          },
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.product.giftDetailsAr!.length,
                        itemBuilder: (ctx, index) {
                          return Text(
                            "• ${widget.product.giftDetailsAr![index]}",
                            style: CustomTextStyle.kTextStyleF12,
                          );
                        },
                      ),
                Gap(15.h),
                Text(
                  widget.product.qty !=0
                      ? S.of(context).availability(S.of(context).inStock)
                      : S.of(context).availability(S.of(context).outOfStock),
                  style: CustomTextStyle.kTextStyleF16,
                ),
                Text(
                  S.of(context).sku(widget.product.sku!),
                  style: CustomTextStyle.kTextStyleF16,
                ),
                Gap(15.h),
                DropdownMenu(
                  width: context.queryWidth.w * 0.8,
                  initialSelection: selectedIndex,
                  label: Text(S.of(context).color),
                  dropdownMenuEntries: widget.product.color!
                      .asMap()
                      .entries
                      .map(
                        (entry) => DropdownMenuEntry(
                          label: entry.value,
                          value: entry.key,
                        ),
                      )
                      .toList(),
                  onSelected: (int? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedIndex = newValue;
                      });
                    }
                  },
                ),
                Gap(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).sar(widget.product.price!),
                      style: CustomTextStyle.kTextStyleF16.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (qty <= 1) {
                              qty;
                            } else {
                              setState(() {
                                qty--;
                              });
                            }
                          },
                          icon: Icon(
                            MdiIcons.minusBox,
                            color: AppColors.textGrey,
                            size: 38.sp,
                          ),
                        ),
                        Gap(5.w),
                        Text(
                          "$qty",
                          style: CustomTextStyle.kTextStyleF16,
                        ),
                        Gap(5.w),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              qty++;
                            });
                          },
                          icon: Icon(
                            MdiIcons.plusBox,
                            color: AppColors.pinkPrimary,
                            size: 38.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(15.h),
                CustomBtn(
                  label: S.of(context).addToCart,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
