import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../../../../../core/shared/entities/product_entity.dart';
import '../../../categories/domain/entities/category_entity.dart';

abstract class ProductsByCategoryRepo{
  Future<Either<Failure, List<ProductEntity>>> getCategoryProducts(CategoryEntity categoryEntity);
}