import 'package:flutter/material.dart';
import 'package:shopping_cart/theme/custom_colors.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 250,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      // padding: const EdgeInsets.all(10),
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
                Image.network(
                  "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png",
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.grey.shade500,
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: ElevatedButton(
                    onPressed: () {},
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "iPhone 9",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  "Apple",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                RichText(
                  text: TextSpan(
                    text: "₹549.00 ",
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey.shade500,
                      decoration: TextDecoration.lineThrough,
                    ),
                    children: const [
                      TextSpan(
                        text: " ₹477.85",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                RichText(
                  text: const TextSpan(
                    text: "12.96% ",
                    style: TextStyle(
                      color: CustomColors.pinkColor,
                      fontSize: 12,
                    ),
                    children: [
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
          )
        ],
      ),
    );
  }
}
