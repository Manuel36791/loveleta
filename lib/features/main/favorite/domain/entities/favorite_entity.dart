import 'package:equatable/equatable.dart';

import '../../../../../core/shared/entities/product_entity.dart';

class FavoriteEntity extends Equatable {
  final num? userId;
  final num? page;
  final List<ProductEntity>? products;
  final num? status;
  final String? message;

  const FavoriteEntity({
    this.userId,
    this.page,
    this.products,
    this.status,
    this.message,
  });

  @override
  List<Object?> get props => [
        userId,
        page,
        products,
        status,
        message,
      ];
}
