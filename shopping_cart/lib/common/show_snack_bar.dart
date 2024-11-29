import 'package:flutter/material.dart';
import 'package:shopping_cart/common/navigate_to_shopping_cart_page.dart';
import 'package:shopping_cart/theme/custom_colors.dart';

void showSnackBar(
  BuildContext context, {
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      action: SnackBarAction(
        label: "View Cart",
        backgroundColor: CustomColors.pinkColor,
        textColor: Colors.white,
        onPressed: () {
          navigateToShoppingCartPage(context);
        },
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      content: Text(
        message,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
