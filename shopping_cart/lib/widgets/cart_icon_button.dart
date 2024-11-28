import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/services/repository/remote_repository_provider.dart';
import 'package:shopping_cart/theme/custom_colors.dart';

class CartIconButton extends ConsumerWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.read(remoteRepositoryProvider.notifier).fetchData();
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
    );
  }
}
