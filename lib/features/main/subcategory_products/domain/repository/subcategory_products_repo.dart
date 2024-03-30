import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../entities/subcategory_products_entity.dart';

abstract class SubCategoryProductsRepo {
  Future<Either<Failure, SubCategoryProductsEntity>> getSubCategoryProducts(SubCategoryProductsEntity subcategoryProductsEntity);
}