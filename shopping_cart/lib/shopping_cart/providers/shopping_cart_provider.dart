import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/services/models/item_data_model.dart';
import 'package:shopping_cart/shopping_cart/models/shopping_item_data_model.dart';

StateNotifierProvider<ShoppingCartNotifier, List<ShoppingItemDataModel>>
    shoppingCartProvider = StateNotifierProvider(
  (ref) => ShoppingCartNotifier(),
);

class ShoppingCartNotifier extends StateNotifier<List<ShoppingItemDataModel>> {
  ShoppingCartNotifier() : super([]);

  void addNewItem(ItemDataModel newItem) {
    final shoppingItem = ShoppingItemDataModel.fromMap(newItem.toMap());

    state.add(shoppingItem);
  }

  void removeItem(ShoppingItemDataModel item) {
    state.removeWhere(
      (element) => element.id == item.id,
    );
  }

  String totalPrice() {
    double totalPrice = 0;

    for (final item in state) {
      totalPrice += item.itemNewPrice!;
    }

    return totalPrice.toStringAsFixed(2);
  }
}
