import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/dimensions.dart';

class OrderProductCard extends StatelessWidget {
  final String? imageUrl;
  final String? productName;
  final num? price;
  final num? quantity;

  const OrderProductCard({
    super.key,
    this.imageUrl,
    this.productName,
    this.price,
    this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80.h,
      // width: 80.w,
      padding: const EdgeInsets.all(Dimensions.p8),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.r5),
            child: CachedNetworkImage(
              imageUrl: imageUrl!,
              width: 129.w,
              height: 132.h,
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: double.infinity,
                  height: 132.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  color: AppColors.pinkSecondary,
                  value: downloadProgress.progress,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error, color: AppColors.errorColor),
            ),
            // child: Image.network(
            //   "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
            // ),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimensions.p8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName!),
                Text("$price SAR",),
                Text("QTY: $quantity")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
