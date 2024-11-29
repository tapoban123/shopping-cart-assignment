import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/catalogue/services/models/pagination_state_model.dart';
import 'package:shopping_cart/catalogue/services/repository/remote_repository_provider.dart';

final paginationStateProvider =
    StateNotifierProvider<PaginationStateNotifier, PaginationStateModel>(
  (ref) => PaginationStateNotifier(ref),
);

class PaginationStateNotifier extends StateNotifier<PaginationStateModel> {
  /// This class contains all the state management logic required for implementing pagination in the application.
  final Ref ref;

  PaginationStateNotifier(this.ref)
      : super(
          PaginationStateModel(
            items: [],
            isLoading: false,
            hasMoreItems: true,
          ),
        ) {
    fetchNextPage();
  }

  late int _skip;
  final int _limit = 10;
  final int _total = 194;

  Future<void> fetchNextPage() async {
    if (state.isLoading || !state.hasMoreItems) return;

    state = state.copyWith(isLoading: true);
    try {
      _skip = state.items.length;

      final nextPageItems = await ref
          .read(remoteRepositoryProvider.notifier)
          .fetchData(_skip, _limit);

      if (nextPageItems.isNotEmpty) {
        state = state.copyWith(
          items: [...state.items, ...nextPageItems],
          hasMoreItems: (_skip + nextPageItems.length) < _total,
        );
      } else {
        state = state.copyWith(hasMoreItems: false);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
