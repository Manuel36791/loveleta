import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? id;
  final String? image;
  final String? name;
  final String? price;
  final String? description;

  const ProductEntity({
    this.id,
    this.image,
    this.name,
    this.price,
    this.description,
  });

  @override
  List<Object?> get props => [
    id,
    image,
    name,
    price,
    description,
  ];
}