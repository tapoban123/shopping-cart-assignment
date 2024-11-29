// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shopping_cart/catalogue/services/models/item_data_model.dart';

class PaginationStateModel {
  final List<ItemDataModel> items;
  final bool isLoading;
  final bool hasMoreItems;

  PaginationStateModel({
    required this.items,
    required this.isLoading,
    required this.hasMoreItems,
  });

  PaginationStateModel copyWith({
    List<ItemDataModel>? items,
    bool? isLoading,
    bool? hasMoreItems,
  }) {
    return PaginationStateModel(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasMoreItems: hasMoreItems ?? this.hasMoreItems,
    );
  }
}
