import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/catalogue/services/models/item_data_model.dart';
import 'package:shopping_cart/shopping_cart/models/shopping_item_data_model.dart';
import 'package:shopping_cart/shopping_cart/pages/shopping_cart_page.dart';

StateNotifierProvider<ShoppingCartNotifier, List<ShoppingItemDataModel>>
    shoppingCartProvider = StateNotifierProvider(
  (ref) => ShoppingCartNotifier(),
);

class ShoppingCartNotifier extends StateNotifier<List<ShoppingItemDataModel>> {
  /// This class all the state management logic that has been implemented in the [ShoppingCartPage].
  List<ShoppingItemDataModel> tempData = [];

  ShoppingCartNotifier() : super([]);

  void addNewItem(ItemDataModel newItem) {
    final shoppingItem = ShoppingItemDataModel(
      id: newItem.id,
      thumbnail: newItem.thumbnail,
      title: newItem.title,
      brand: newItem.brand ?? "",
      price: newItem.price,
      discountPercentage: newItem.discountPercentage,
      itemNewPrice: newItem.itemNewPrice!,
      itemCount: 1,
    );

    if (itemExists(shoppingItem)) {
      final existingItem = state.firstWhere(
        (element) => element.id == newItem.id,
      );

      state[state.indexOf(existingItem)] = existingItem.copyWith(
        itemCount: existingItem.itemCount + 1,
      );

      state = [...state];
    } else {
      state = [...state, shoppingItem];
    }
  }

  bool itemExists(ShoppingItemDataModel searchItem) {
    for (final item in state) {
      if (item.id == searchItem.id) {
        return true;
      }
    }
    return false;
  }

  List<ShoppingItemDataModel> getDistinctItems() {
    return state.toSet().toList();
  }

  void removeItem(ShoppingItemDataModel item) {
    if (item.itemCount > 1) {
      state[state.indexOf(state.firstWhere(
        (element) => element.id == item.id,
      ))] = item.copyWith(itemCount: item.itemCount - 1);
    } else {
      state.removeWhere(
        (element) => element.id == item.id,
      );
    }

    state = [...state];
  }

  int itemCount(int itemId) {
    int count = 0;

    for (final item in state) {
      if (itemId == item.id) {
        count++;
      }
    }

    return count;
  }

  int totalItemCount() {
    int count = 0;

    for (final item in state) {
      count += item.itemCount;
    }

    return count;
  }

  String totalPrice() {
    double totalPrice = 0;

    for (final item in state) {
      totalPrice += (item.itemNewPrice * item.itemCount);
    }

    return totalPrice.toStringAsFixed(2);
  }
}
