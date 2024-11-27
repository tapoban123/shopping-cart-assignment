import 'package:flutter/material.dart';
import 'package:shopping_cart/theme/custom_colors.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogue"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              alignment: Alignment.topRight,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                ),
                Container(
                  width: 18,
                  height: 14,
                  decoration: BoxDecoration(
                    color: CustomColors.pinkColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "10",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
