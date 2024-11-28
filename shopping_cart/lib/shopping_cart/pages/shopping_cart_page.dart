import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/services/models/item_data_model.dart';
import 'package:shopping_cart/shopping_cart/models/shopping_item_data_model.dart';
import 'package:shopping_cart/shopping_cart/providers/shopping_cart_provider.dart';
import 'package:shopping_cart/theme/custom_colors.dart';
import 'package:shopping_cart/widgets/shopping_cart_page_bottom_widget.dart';
import 'package:shopping_cart/widgets/shopping_item_card.dart';

class ShoppingCartPage extends ConsumerStatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  ConsumerState<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends ConsumerState<ShoppingCartPage> {
  List<ShoppingItemDataModel> shoppingItems = [];

  @override
  Widget build(BuildContext context) {
    shoppingItems = ref.watch(shoppingCartProvider).toSet().toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      bottomNavigationBar: const ShoppingCartPageBottomWidget(),
      body: shoppingItems.isEmpty
          ? const Center(
              child: Text(
                "Shopping Cart is Empty.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            )
          : ListView.builder(
              itemCount: shoppingItems.length,
              itemBuilder: (context, index) {
                return ShoppingItemCard(
                  shoppingItem: shoppingItems[index],
                );
              },
            ),
    );
  }
}
