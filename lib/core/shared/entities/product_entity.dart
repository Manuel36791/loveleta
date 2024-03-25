import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final num? id;
  final String? category;
  final String? mainImage;
  final List<String>? images;
  final String? nameEn;
  final String? nameAr;
  final String? descriptionEn;
  final String? descriptionAr;
  final List<String>? giftDetailsEn;
  final List<String>? giftDetailsAr;
  final bool? inStock;
  final String? sku;
  final List<String>? color;
  final num? price;
  final num? discount;
  final num? discountedPrice;
  final bool? isFavorite;
  final bool? isExpress;
  final bool? isFreeDelivery;
  final bool? isNew;
  final bool? bestSeller;

  const ProductEntity({
    this.id,
    this.category,
    this.mainImage,
    this.images,
    this.nameEn,
    this.nameAr,
    this.descriptionEn,
    this.descriptionAr,
    this.giftDetailsEn,
    this.giftDetailsAr,
    this.inStock,
    this.sku,
    this.color,
    this.price,
    this.discount,
    this.discountedPrice,
    this.isFavorite,
    this.isExpress,
    this.isFreeDelivery,
    this.isNew,
    this.bestSeller,
  });

  @override
  List<Object?> get props => [
        id,
        category,
        mainImage,
        images,
        nameEn,
        nameAr,
        descriptionEn,
        descriptionAr,
        giftDetailsEn,
        giftDetailsAr,
        inStock,
        sku,
        color,
        price,
        discount,
        discountedPrice,
        isFavorite,
        isExpress,
        isFreeDelivery,
        isNew,
        bestSeller,
      ];
}
