import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/shared/entities/product_entity.dart';
import '../../../domain/repository/best_seller_repo.dart';

part 'best_seller_states.dart';

part 'best_seller_cubit.freezed.dart';

class BestSellerCubit extends Cubit<BestSellerStates> {
  BestSellerCubit({required this.bestSellerRepo})
      : super(const BestSellerStates.initial());

  static BestSellerCubit get(context) => BlocProvider.of(context);

  final BestSellerRepo bestSellerRepo;

  getBestSellers(int nextPage) async {
    emit(const BestSellerStates.loading());

    final result = await bestSellerRepo.getBestSellers(nextPage);

    result.fold(
      (l) => emit(
        BestSellerStates.error(l.code.toString(), l.message),
      ),
      (r) => emit(
        BestSellerStates.success(r),
      ),
    );
  }
}
