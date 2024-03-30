import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../../../../../core/shared/entities/product_entity.dart';
import '../repository/new_products_repo.dart';

class NewProductsUseCase {
 final NewProductsRepo newProductsRepo;

  NewProductsUseCase({required this.newProductsRepo});

  Future<Either<Failure, List<ProductEntity>>> call(int nextPage) async => await newProductsRepo.getNewProducts(nextPage);
}