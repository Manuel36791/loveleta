import '../../domain/entities/category_entity.dart';
import 'subcategory_model.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    super.id,
    super.nameEn,
    super.nameAr,
    super.image,
    super.subCategories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      image: json['image'],
      subCategories: json['sub_categories']
          .map((item) => SubCategoryModel.fromJson(item))
          .toList(),
    );
  }

  static Map<String, dynamic> toJson(CategoryEntity categoryEntity) {
    return {
      'category_id': categoryEntity.id,
    };
  }
}
