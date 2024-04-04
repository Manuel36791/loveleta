import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:loveleta/core/utils/extensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../features/main/product_details/domain/entities/favorite_product_entity.dart';
import '../../../features/main/product_details/presentation/add_to_favortes_cubit/add_to_favorites_cubit.dart';
import '../../../features/main/product_details/presentation/check_if_favorite_cubit/check_if_favorite_cubit.dart';
import '../../../generated/l10n.dart';
import '../../dependency_injection/di.dart' as di;
import '../../router/router.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/dimensions.dart';
import '../arguments.dart';
import '../entities/product_entity.dart';
import '../models/user_data_model.dart';

class ProductCard extends StatefulWidget {
  final ProductEntity product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.di<AddToFavoritesCubit>(),
        ),
        BlocProvider(
          create: (context) => di.di<CheckIfFavoriteCubit>()
            ..checkFavorite(
              FavoriteProductEntity(
                userId: UserData.id,
                productId: widget.product.id,
              ),
            )
            ..getIfFavorite(),
        ),
      ],
      child: BlocConsumer<CheckIfFavoriteCubit, CheckIfFavoriteStates>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            success: (state) {
              if (state.status == 1) {
                favorite = true;
              }
            },
          );
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              context.pushNamed(
                productDetailsPageRoute,
                arguments: ProductDetailsArgs(
                  product: widget.product,
                ),
              );
            },
            child: SizedBox(
              width: 129.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            "${AppConstants.imageUrl}${widget.product.mainImage}",
                        width: 129.w,
                        height: 132.h,
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            width: double.infinity,
                            height: 132.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "${AppConstants.imageUrl}${widget.product.mainImage}"),
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
                            const Icon(Icons.error),
                      ),
                      BlocConsumer<AddToFavoritesCubit, AddToFavoritesStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          AddToFavoritesCubit addToFavoritesCubit =
                          AddToFavoritesCubit.get(context);
                          // bool favorite = CacheHelper.getData("isFavorite");
                          return Positioned(
                            top: 10.h,
                            right: 10.w,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  favorite = !favorite;
                                });
                                addToFavoritesCubit.addFavorite(
                                  FavoriteProductEntity(
                                    userId: UserData.id,
                                    productId: widget.product.id,
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: Dimensions.r20,
                                child: Icon(
                                  MdiIcons.heart,
                                  size: 25.sp,
                                  color:
                                  favorite ? Colors.red : Colors.grey,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  Gap(5.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Intl.getCurrentLocale() == "en"
                            ? widget.product.nameEn!
                            : widget.product.nameAr!,
                        style: CustomTextStyle.kTextStyleF12,
                      ),
                      Text(
                        widget.product.price!.toString(),
                        style: CustomTextStyle.kTextStyleF14.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gap(20.h),
                      Align(
                        alignment: Alignment.center,
                        child: widget.product.isExpress == 1
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.p8.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.yellowSecondary,
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.r50,
                                  ),
                                ),
                                child: Text(
                                  S.of(context).loveletaExpress,
                                  style: CustomTextStyle.kTextStyleF12.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.p8.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.greenSecondary,
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.r50,
                                  ),
                                ),
                                child: Text(
                                  S.of(context).freeDelivery,
                                  style: CustomTextStyle.kTextStyleF12.copyWith(
                                    color: AppColors.textWhite,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
