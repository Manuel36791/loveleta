import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final num? id;
  final String? nameEn;
  final String? nameAr;
  final num? price;
  final num? qty;
  final String? sku;
  final String? mainImage;
  final String? giftDetailsEn;
  final String? giftDetailsAr;
  final List<dynamic>? color;
  final num? status;
  final num? discount;
  final num? discountedPrice;
  final String? descriptionEn;
  final String? descriptionAr;
  final num? categoryId;
  final num? isFavorite;
  final num? isFreeDelivery;
  final num? isExpress;
  final num? isNew;
  final num? bestSeller;
  final List<ProductImagesEntity>? images;

  const ProductEntity({
    this.id,
    this.nameEn,
    this.nameAr,
    this.price,
    this.qty,
    this.sku,
    this.mainImage,
    this.giftDetailsEn,
    this.giftDetailsAr,
    this.color,
    this.status,
    this.discount,
    this.discountedPrice,
    this.descriptionEn,
    this.descriptionAr,
    this.categoryId,
    this.isFavorite,
    this.isFreeDelivery,
    this.isExpress,
    this.isNew,
    this.bestSeller,
    this.images,
  });

  @override
  List<Object?> get props => [
        id,
        nameEn,
        nameAr,
        price,
        qty,
        sku,
        mainImage,
        giftDetailsEn,
        giftDetailsAr,
        color,
        status,
        discount,
        discountedPrice,
        descriptionEn,
        descriptionAr,
        categoryId,
        isFavorite,
        isFreeDelivery,
        isExpress,
        isNew,
        bestSeller,
        images,
      ];
}

class ProductImagesEntity extends Equatable {
  final num? id;
  final num? productId;
  final String? image;

  const ProductImagesEntity({
    this.id,
    this.productId,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        productId,
        image,
      ];
}
