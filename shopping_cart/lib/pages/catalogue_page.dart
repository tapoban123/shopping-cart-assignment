import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/services/repository/remote_repository_provider.dart';
import 'package:shopping_cart/theme/custom_colors.dart';
import 'package:shopping_cart/widgets/cart_icon_button.dart';
import 'package:shopping_cart/widgets/item_card.dart';

class CataloguePage extends ConsumerStatefulWidget {
  const CataloguePage({super.key});

  @override
  ConsumerState<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends ConsumerState<CataloguePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogue"),
        centerTitle: true,
        actions: const [
          CartIconButton(),
        ],
      ),
      body: ref.watch(itemDataFutureProvider).when(
            data: (itemData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: GridView.builder(
                  itemCount: itemData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 320,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return ItemCard(
                      itemData: itemData[index],
                    );
                  },
                ),
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
    );
  }
}
