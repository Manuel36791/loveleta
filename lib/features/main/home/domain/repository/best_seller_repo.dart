import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../../../../../core/shared/entities/product_entity.dart';

abstract class BestSellerRepo {
  Future<Either<Failure, List<ProductEntity>>> getBestSellers(int nextPage);
}