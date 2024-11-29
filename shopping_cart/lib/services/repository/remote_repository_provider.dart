import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/services/models/item_data_model.dart';
import 'package:http/http.dart' as http;

StateNotifierProvider<RemoteRepositoryNotifier, List<ItemDataModel>?>
    remoteRepositoryProvider = StateNotifierProvider(
  (ref) => RemoteRepositoryNotifier(),
);

class RemoteRepositoryNotifier extends StateNotifier<List<ItemDataModel>?> {
  RemoteRepositoryNotifier() : super(null);

  Future<List<ItemDataModel>> fetchData(int skip, int limit) async {
    try {
      Uri url =
          Uri.parse("https://dummyjson.com/products?skip=$skip&limit=$limit");

      final response = await http.get(url);

      List<ItemDataModel> formattedItemData = [];

      if (response.statusCode == 200) {
        final itemData = jsonDecode(response.body)['products'];

        for (final item in itemData) {
          final data = ItemDataModel.fromMap(item as Map<String, dynamic>);

          final newData = data.copyWith(
            itemNewPrice: double.parse(
                (data.price - ((data.discountPercentage / 100) * data.price))
                    .toStringAsFixed(2)),
          );
          formattedItemData.add(newData);
        }

        state = formattedItemData;
      }

      return formattedItemData;
    } catch (e) {
      throw HttpException(e.toString());
    }
  }
}
