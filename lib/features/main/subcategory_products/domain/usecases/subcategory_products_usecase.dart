import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../entities/subcategory_products_entity.dart';
import '../repository/subcategory_products_repo.dart';

class SubCategoryProductsUseCase {
  final SubCategoryProductsRepo categoryProductsRepo;

  SubCategoryProductsUseCase({required this.categoryProductsRepo});

  Future<Either<Failure, SubCategoryProductsEntity>> call(SubCategoryProductsEntity subcategoryProductsEntity) {
    return categoryProductsRepo.getSubCategoryProducts(subcategoryProductsEntity);
  }
}
