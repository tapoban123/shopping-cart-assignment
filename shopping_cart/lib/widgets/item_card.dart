import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/services/models/item_data_model.dart';
import 'package:shopping_cart/shopping_cart/providers/shopping_cart_provider.dart';
import 'package:shopping_cart/theme/custom_colors.dart';

class ItemCard extends ConsumerWidget {
  final ItemDataModel itemData;

  const ItemCard({
    super.key,
    required this.itemData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: Image.network(
                    itemData.thumbnail,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.grey.shade500,
                          strokeWidth: 2,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: ElevatedButton(
                    onPressed: () {
                      // final shoppingItem = ShoppingItemDataModel(
                      //   id: itemData.id,
                      //   thumbnail: itemData.thumbnail,
                      //   title: itemData.title,
                      //   brand: itemData.brand,
                      //   price: itemData.price,
                      //   discountPercentage: itemData.discountPercentage,
                      //   itemNewPrice: itemData.itemNewPrice!,
                      //   itemCount: 1,
                      // );
                      ref
                          .read(shoppingCartProvider.notifier)
                          .addNewItem(itemData);
                    },
                    style: ElevatedButton.styleFrom(
                      enableFeedback: false,
                      backgroundColor: Colors.white.withOpacity(0.9),
                      overlayColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      fixedSize: const Size(100, 30),
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        color: CustomColors.pinkColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0).copyWith(top: 16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final parentWidth = constraints.maxWidth;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 20,
                          child: Text(
                            itemData.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: parentWidth * 0.09,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Text(
                          itemData.brand ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "₹${itemData.price} ",
                            style: TextStyle(
                              fontSize: 13.5,
                              color: Colors.grey.shade500,
                              decoration: TextDecoration.lineThrough,
                            ),
                            children: [
                              TextSpan(
                                text: " ₹${itemData.itemNewPrice}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              )
                            ],
                          ),
                        ),
                        // const SizedBox(
                        //   height: 8,
                        // ),
                        RichText(
                          text: TextSpan(
                            text: "${itemData.discountPercentage}% ",
                            style: const TextStyle(
                              color: CustomColors.pinkColor,
                              fontSize: 12,
                            ),
                            children: const [
                              TextSpan(
                                text: " OFF",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
