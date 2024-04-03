import '../entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    super.id,
    super.nameEn,
    super.nameAr,
    super.price,
    super.qty,
    super.userQty,
    super.sku,
    super.mainImage,
    super.giftDetailsEn,
    super.giftDetailsAr,
    super.color,
    super.status,
    super.discount,
    super.discountedPrice,
    super.descriptionEn,
    super.descriptionAr,
    super.categoryId,
    super.isFavorite,
    super.isFreeDelivery,
    super.isExpress,
    super.isNew,
    super.bestSeller,
    super.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      price: json['price'],
      qty: json['quantity'],
      sku: json['SKU'],
      mainImage: json['main_image'],
      giftDetailsEn: json['gift_details_en'],
      giftDetailsAr: json['gift_details_ar'],
      color: json['color'],
      status: json['status'],
      discount: json['discount'],
      discountedPrice: json['price_after_discount'],
      descriptionEn: json['description_en'],
      descriptionAr: json['description_ar'],
      categoryId: json['category_id'],
      isFavorite: json['is_favourite'],
      isFreeDelivery: json['is_free_delivery'],
      isExpress: json['is_express'],
      isNew: json['is_new'],
      bestSeller: json["best_seller"],
      images: List<ProductImagesModel>.from(json["product_images"]!
          .map((x) => ProductImagesModel.fromJson(x))),
    );
  }

  static Map<String, dynamic> toJson(ProductEntity productEntity) {
    return {
      'id': productEntity.id,
    };
  }
}

class ProductImagesModel extends ProductImagesEntity {
  const ProductImagesModel({
    super.id,
    super.productId,
    super.image,
  });

  factory ProductImagesModel.fromJson(Map<String, dynamic> json) {
    return ProductImagesModel(
      id: json['id'],
      productId: json['product_id'],
      image: json['image'],
    );
  }
}
