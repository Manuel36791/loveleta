import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final num? id;
  final String? nameEn;
  final String? nameAr;
  final String? image;

  const CategoryEntity({
    this.id,
    this.nameEn,
    this.nameAr,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        nameEn,
        nameAr,
        image,
      ];
}
