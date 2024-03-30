import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../../../../../core/shared/entities/product_entity.dart';
import '../../../categories/domain/entities/category_entity.dart';
import '../repository/products_by_category.dart';

class ProductsByCategoryUseCase {
  final ProductsByCategoryRepo productsByCategoryRepo;

  ProductsByCategoryUseCase({required this.productsByCategoryRepo});

  Future<Either<Failure, List<ProductEntity>>> call(CategoryEntity categoryEntity) async {
    return await productsByCategoryRepo.getCategoryProducts(categoryEntity);
  }

}