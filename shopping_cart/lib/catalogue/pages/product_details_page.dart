import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/catalogue/services/models/item_data_model.dart';
import 'package:shopping_cart/common/show_snack_bar.dart';
import 'package:shopping_cart/shopping_cart/providers/shopping_cart_provider.dart';
import 'package:shopping_cart/theme/custom_colors.dart';

class ProductDetailsPage extends ConsumerWidget {
  final ItemDataModel itemData;

  const ProductDetailsPage({
    super.key,
    required this.itemData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Essence Mascara Lash Princess"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 360,
              child: Hero(
                tag: itemData.id,
                child: Image.network(
                  itemData.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemData.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          itemData.brand ?? "",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                            ),
                            text: "₹${itemData.price}",
                            children: [
                              TextSpan(
                                text: "  ₹${itemData.itemNewPrice}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "${itemData.discountPercentage}% ",
                            style: const TextStyle(
                              fontSize: 16,
                              color: CustomColors.pinkColor,
                            ),
                            children: const [
                              TextSpan(
                                text: "OFF",
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ).copyWith(bottom: 70.0),
                      child: ElevatedButton(
                        onPressed: () {
                          ref
                              .read(shoppingCartProvider.notifier)
                              .addNewItem(itemData);
                          ScaffoldMessenger.of(context).clearSnackBars();

                          showSnackBar(context,
                              message:
                                  "Added ${itemData.title} to cart.");
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: CustomColors.pinkColor,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
