import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/shopping_cart/pages/shopping_cart_page.dart';
import 'package:shopping_cart/shopping_cart/providers/shopping_cart_provider.dart';
import 'package:shopping_cart/theme/custom_colors.dart';

class CartIconButton extends ConsumerWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalItems = ref.read(shoppingCartProvider.notifier).totalItemCount();

    final shoppingCartState = ref.watch(shoppingCartProvider).length;

    return IconButton(
      onPressed: () {
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
      },
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
            child: Text(
              totalItems.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9,
              ),
            ),
          )
        ],
      ),
    );
  }
}
