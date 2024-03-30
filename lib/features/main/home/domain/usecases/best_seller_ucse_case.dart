import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../../../../../core/shared/entities/product_entity.dart';
import '../repository/best_seller_repo.dart';

class BestSellerUseCase {

  final BestSellerRepo bestSellerRepo;

  BestSellerUseCase({required this.bestSellerRepo});

  Future<Either<Failure, List<ProductEntity>>> call(int nextPage) async => await bestSellerRepo.getBestSellers(nextPage);
}