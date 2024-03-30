import 'package:equatable/equatable.dart';

class SubCategoryEntity extends Equatable {
  final num? id;
  final String? nameEn;
  final String? nameAr;
  final String? image;
  final String? descriptionEn;
  final String? descriptionAr;
  final dynamic categoryId;

  const SubCategoryEntity({
    this.id,
    this.nameEn,
    this.nameAr,
    this.image,
    this.descriptionEn,
    this.descriptionAr,
    this.categoryId,
  });

  @override
  List<Object?> get props => [
        id,
        nameEn,
        nameAr,
        image,
        descriptionEn,
        descriptionAr,
        categoryId,
      ];
}
