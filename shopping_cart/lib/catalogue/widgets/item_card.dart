import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/catalogue/pages/product_details_page.dart';
import 'package:shopping_cart/catalogue/services/models/item_data_model.dart';
import 'package:shopping_cart/common/show_snack_bar.dart';
import 'package:shopping_cart/shopping_cart/providers/shopping_cart_provider.dart';
import 'package:shopping_cart/theme/custom_colors.dart';
import 'package:shopping_cart/catalogue/pages/catalogue_page.dart';

class ItemCard extends ConsumerStatefulWidget {
  /// This widget displays each item on the [CataloguePage]
  final ItemDataModel itemData;

  const ItemCard({
    super.key,
    required this.itemData,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemCardState();
}

class _ItemCardState extends ConsumerState<ItemCard> {
  void navigateToItemDetails(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ProductDetailsPage(itemData: widget.itemData),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        ));

        return FadeTransition(
          opacity: tween,
          child: child,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  GestureDetector(
                    onTap: () => navigateToItemDetails(context),
                    child: SizedBox(
                      width: double.infinity,
                      height: 180,
                      child: Hero(
                        tag: widget.itemData.id,
                        child: Image.network(
                          widget.itemData.thumbnail,
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
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: ElevatedButton(
                      onPressed: () {
                        ref
                            .read(shoppingCartProvider.notifier)
                            .addNewItem(widget.itemData);

                        ScaffoldMessenger.of(context).clearSnackBars();

                        showSnackBar(context,
                            message: "Added ${widget.itemData.title} to cart.");
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
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0).copyWith(top: 16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final parentWidth = constraints.maxWidth;

                return GestureDetector(
                  onTap: () => navigateToItemDetails(context),
                  child: Column(
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
                              widget.itemData.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: parentWidth * 0.09,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Text(
                            widget.itemData.brand ?? "",
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
                              text: "₹${widget.itemData.price} ",
                              style: TextStyle(
                                fontSize: 13.5,
                                color: Colors.grey.shade500,
                                decoration: TextDecoration.lineThrough,
                              ),
                              children: [
                                TextSpan(
                                  text: " ₹${widget.itemData.itemNewPrice}",
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
                          RichText(
                            text: TextSpan(
                              text: "${widget.itemData.discountPercentage}% ",
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
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
