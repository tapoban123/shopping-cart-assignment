import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/services/models/item_data_model.dart';
import 'package:shopping_cart/shopping_cart/models/shopping_item_data_model.dart';
import 'package:shopping_cart/shopping_cart/providers/shopping_cart_provider.dart';
import 'package:shopping_cart/theme/custom_colors.dart';
import 'package:shopping_cart/widgets/item_card.dart';

class ShoppingItemCard extends ConsumerStatefulWidget {
  final ShoppingItemDataModel shoppingItem;

  const ShoppingItemCard({
    super.key,
    required this.shoppingItem,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ShoppingItemCardState();
}

class _ShoppingItemCardState extends ConsumerState<ShoppingItemCard> {
  @override
  Widget build(BuildContext context) {
    final itemCount =
        ref.watch(shoppingCartProvider.notifier).itemCount(widget.shoppingItem);

    return Container(
      height: 160,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 130,
              height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Image.network(
                widget.shoppingItem.thumbnail,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.shoppingItem.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    widget.shoppingItem.brand,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.6,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "₹${widget.shoppingItem.price} ",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                        decoration: TextDecoration.lineThrough,
                      ),
                      children: [
                        TextSpan(
                          text: " ₹${widget.shoppingItem.itemNewPrice}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "${widget.shoppingItem.discountPercentage}% ",
                      style: const TextStyle(
                        color: CustomColors.pinkColor,
                        fontSize: 11,
                      ),
                      children: const [
                        TextSpan(
                          text: " OFF",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 90,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(shoppingCartProvider.notifier)
                                  .removeItem(widget.shoppingItem);
                            },
                            child: const Icon(
                              CupertinoIcons.minus,
                            ),
                          ),
                          Text(
                            itemCount.toString(),
                            style: const TextStyle(
                              color: CustomColors.pinkColor,
                              fontSize: 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(shoppingCartProvider.notifier)
                                  .addNewItem(
                                    ItemDataModel.fromMap(
                                      widget.shoppingItem.toMap(),
                                    ),
                                  );
                            },
                            child: const Icon(CupertinoIcons.plus),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
