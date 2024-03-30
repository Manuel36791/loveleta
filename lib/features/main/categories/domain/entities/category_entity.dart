import 'package:equatable/equatable.dart';


class CategoryEntity extends Equatable {
  final num? id;
  final num? nextPage;
  final String? nameEn;
  final String? nameAr;
  final String? image;
  final List<dynamic>? subCategories;

  const CategoryEntity({
    this.id,
    this.nextPage,
    this.nameEn,
    this.nameAr,
    this.image,
    this.subCategories,
  });

  @override
  List<Object?> get props => [
        id,
    nextPage,
        nameEn,
        nameAr,
        image,
    subCategories,
      ];
}
