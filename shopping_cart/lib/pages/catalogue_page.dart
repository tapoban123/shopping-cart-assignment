import 'package:flutter/material.dart';
import 'package:shopping_cart/theme/custom_colors.dart';
import 'package:shopping_cart/widgets/cart_icon_button.dart';
import 'package:shopping_cart/widgets/item_card.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogue"),
        centerTitle: true,
        actions: const [
          CartIconButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 320,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ItemCard();
          },
        ),
      ),
    );
  }
}
