
import '../../../../../core/shared/entities/product_entity.dart';
import '../../../../../core/shared/models/product_model.dart';
import '../../domain/entities/search_entity.dart';

class SearchModel extends SearchEntity {
  const SearchModel({
    super.searchText,
    super.nextPage,
    super.products,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      products: json['data'] == null
          ? []
          : List<ProductEntity>.from(
              json["data"]!.map(
                (x) => ProductModel.fromJson(x),
              ),
            ),
    );
  }

  static Map<String, dynamic> toJson(SearchEntity searchEntity) {
    return {
      'query': searchEntity.searchText,
      'page': searchEntity.nextPage,
    };
  }
}
