import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../entities/category_entity.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}