import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/catalogue/services/repository/pagination_state_provider.dart';
import 'package:shopping_cart/catalogue/widgets/cart_icon_button.dart';
import 'package:shopping_cart/catalogue/widgets/item_card.dart';

class CataloguePage extends ConsumerStatefulWidget {
  const CataloguePage({super.key});

  @override
  ConsumerState<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends ConsumerState<CataloguePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
                _scrollController.offset &&
            !ref.read(paginationStateProvider).isLoading) {
          ref.read(paginationStateProvider.notifier).fetchNextPage();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final paginationState = ref.watch(paginationStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogue"),
        centerTitle: true,
        actions: const [
          CartIconButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: GridView.builder(
          controller: _scrollController,
          itemCount: paginationState.items.length +
              (paginationState.hasMoreItems ? 1 : 0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 320,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            if (index == paginationState.items.length) {
              return const Center(child: CircularProgressIndicator());
            }
            final item = paginationState.items[index];
            return ItemCard(
              itemData: item,
            );
          },
        ),
      ),
    );
  }
}
