import 'package:flutter/material.dart';
import 'package:shopping_cart/shopping_cart/pages/shopping_cart_page.dart';

void navigateToShoppingCartPage(BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();

  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ShoppingCartPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.decelerate,
      ));

      return SlideTransition(
        position: tween,
        child: child,
      );
    },
  ));
}
