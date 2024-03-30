import '../../domain/entities/subcategory_entity.dart';

class SubCategoryModel extends SubCategoryEntity {
  const SubCategoryModel({
    super.id,
    super.nameEn,
    super.nameAr,
    super.image,
    super.descriptionEn,
    super.descriptionAr,
    super.categoryId,
});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      image: json['image'],
      descriptionEn: json['description_en'],
      descriptionAr: json['description_ar'],
      categoryId: json['category_id'],
    );
  }
}