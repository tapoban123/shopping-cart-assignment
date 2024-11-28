import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/services/models/item_data_model.dart';
import 'package:shopping_cart/shopping_cart/models/shopping_item_data_model.dart';

StateNotifierProvider<ShoppingCartNotifier, List<ShoppingItemDataModel>>
    shoppingCartProvider = StateNotifierProvider(
  (ref) => ShoppingCartNotifier(),
);

class ShoppingCartNotifier extends StateNotifier<List<ShoppingItemDataModel>> {
  List<ShoppingItemDataModel> tempData = [];

  ShoppingCartNotifier() : super([]);

  void addNewItem(ItemDataModel newItem) {
    final shoppingItem = ShoppingItemDataModel(
      id: newItem.id,
      thumbnail: newItem.thumbnail,
      title: newItem.title,
      brand: newItem.brand,
      price: newItem.price,
      discountPercentage: newItem.discountPercentage,
      itemNewPrice: newItem.itemNewPrice!,
      itemCount: 1,
    );

    state = [...state, shoppingItem];
  }

  List<ShoppingItemDataModel> getDistinctItems() {
    return state.toSet().toList();
  }

  void removeItem(ShoppingItemDataModel item) {
    state.removeAt(
      state.indexOf(
        state.lastWhere((element) => element.id == element.id),
      ),
    );
    state = [...state];
  }

  int itemCount(ShoppingItemDataModel searchItem) {
    int count = 0;

    for (final item in state) {
      if (searchItem.id == item.id) {
        count++;
      }
    }

    return count;
  }

  String totalPrice() {
    double totalPrice = 0;

    for (final item in state) {
      totalPrice += item.itemNewPrice;
    }

    return totalPrice.toStringAsFixed(2);
  }
}
