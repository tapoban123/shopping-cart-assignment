import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/services/models/item_data_model.dart';
import 'package:http/http.dart' as http;

StateNotifierProvider<RemoteRepositoryNotifier, ItemDataModel?>
    remoteRepositoryProvider = StateNotifierProvider(
  (ref) => RemoteRepositoryNotifier(),
);

class RemoteRepositoryNotifier extends StateNotifier<ItemDataModel?> {
  RemoteRepositoryNotifier() : super(null);

  void fetchData() async {
    Uri url = Uri.parse("https://dummyjson.com/products");

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw const HttpException("Failed to fetch data");
    }

    final itemData = jsonDecode(response.body)['products'];

    List<ItemDataModel> formattedItemData = [];

    for (final item in itemData) {
      formattedItemData.add(ItemDataModel.fromMap(item as Map<String, dynamic>));
    }

    print(formattedItemData);
  }
}
