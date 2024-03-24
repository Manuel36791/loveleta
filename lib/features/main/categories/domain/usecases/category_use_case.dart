import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../entities/category_entity.dart';
import '../repository/category_repo.dart';

class CategoryUseCase {
  final CategoryRepo categoryRepo;

  CategoryUseCase({required this.categoryRepo});

  Future<Either<Failure, List<CategoryEntity>>> call() {
    return categoryRepo.getCategories();
  }
}
