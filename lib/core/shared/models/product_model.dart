import '../entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    super.id,
    super.category,
    super.mainImage,
    super.images,
    super.nameEn,
    super.nameAr,
    super.descriptionEn,
    super.descriptionAr,
    super.giftDetailsEn,
    super.giftDetailsAr,
    super.inStock,
    super.sku,
    super.color,
    super.price,
    super.discount,
    super.discountedPrice,
    super.isFavorite,
    super.isExpress,
    super.isFreeDelivery,
    super.isNew,
    super.bestSeller,
  });


  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as num,
      category: map['category'] as String,
      mainImage: map['main_image'] as String,
      images: map['images'] as List<String>,
      nameEn: map['name_en'] as String,
      nameAr: map['name_ar'] as String,
      descriptionEn: map['description_en'] as String,
      descriptionAr: map['description_ar'] as String,
      giftDetailsEn: map['giftDetails_en'] as List<String>,
      giftDetailsAr: map['giftDetails_ar'] as List<String>,
      inStock: map['in_stock'] as bool,
      sku: map['sku'] as String,
      color: map['color'] as List<String>,
      price: map['price'] as num,
      discount: map['discount'] as num,
      discountedPrice: map['discounted_price'] as num,
      isFavorite: map['is_favorite'] as bool,
      isExpress: map['is_express'] as bool,
      isFreeDelivery: map['is_free_delivery'] as bool,
      isNew: map['is_new'] as bool,
      bestSeller: map['best_seller'] as bool,
    );
  }

  static Map<String, dynamic> toMap(ProductEntity productEntity) {
    return {
      'id': productEntity.id,
      'category': productEntity.category,
      'mainImage': productEntity.mainImage,
      'images': productEntity.images,
      'nameEn': productEntity.nameEn,
      'nameAr': productEntity.nameAr,
      'descriptionEn': productEntity.descriptionEn,
      'descriptionAr': productEntity.descriptionAr,
      'giftDetailsEn': productEntity.giftDetailsEn,
      'giftDetailsAr': productEntity.giftDetailsAr,
      'inStock': productEntity.inStock,
      'sku': productEntity.sku,
      'color': productEntity.color,
      'price': productEntity.price,
      'discount': productEntity.discount,
      'discountedPrice': productEntity.discountedPrice,
      'isFavorite': productEntity.isFavorite,
      'isExpress': productEntity.isExpress,
      'isFreeDelivery': productEntity.isFreeDelivery,
      'isNew': productEntity.isNew,
      'bestSeller': productEntity.bestSeller,
    };
  }
}