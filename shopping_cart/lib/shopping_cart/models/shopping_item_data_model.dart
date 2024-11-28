// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shopping_cart/services/models/item_data_model.dart';

class ShoppingItemDataModel {
  final int id;
  final String thumbnail;
  final String title;
  final String brand;
  final double price;
  final double discountPercentage;
  final double itemNewPrice;
  int itemCount;

  ShoppingItemDataModel({
    required this.id,
    required this.thumbnail,
    required this.title,
    required this.brand,
    required this.price,
    required this.discountPercentage,
    required this.itemNewPrice,
    required this.itemCount ,
  });

  ShoppingItemDataModel copyWith({
    int? id,
    String? thumbnail,
    String? title,
    String? brand,
    double? price,
    double? discountPercentage,
    double? itemNewPrice,
    int? itemCount,
  }) {
    return ShoppingItemDataModel(
      id: id ?? this.id,
      thumbnail: thumbnail ?? this.thumbnail,
      title: title ?? this.title,
      brand: brand ?? this.brand,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      itemNewPrice: itemNewPrice ?? this.itemNewPrice,
      itemCount: itemCount ?? this.itemCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'thumbnail': thumbnail,
      'title': title,
      'brand': brand,
      'price': price,
      'discountPercentage': discountPercentage,
      'itemNewPrice': itemNewPrice,
      'itemCount': itemCount,
    };
  }

  factory ShoppingItemDataModel.fromMap(Map<String, dynamic> map) {
    return ShoppingItemDataModel(
      id: map['id'] as int,
      thumbnail: map['thumbnail'] as String,
      title: map['title'] as String,
      brand: map['brand'] as String,
      price: map['price'] as double,
      discountPercentage: map['discountPercentage'] as double,
      itemNewPrice: map['itemNewPrice'] as double,
      itemCount: map['itemCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShoppingItemDataModel.fromJson(String source) =>
      ShoppingItemDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShoppingItemDataModel(id: $id, thumbnail: $thumbnail, title: $title, brand: $brand, price: $price, discountPercentage: $discountPercentage, itemNewPrice: $itemNewPrice, itemCount: $itemCount)';
  }

  @override
  bool operator ==(covariant ShoppingItemDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.thumbnail == thumbnail &&
        other.title == title &&
        other.brand == brand &&
        other.price == price &&
        other.discountPercentage == discountPercentage &&
        other.itemNewPrice == itemNewPrice &&
        other.itemCount == itemCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        thumbnail.hashCode ^
        title.hashCode ^
        brand.hashCode ^
        price.hashCode ^
        discountPercentage.hashCode ^
        itemNewPrice.hashCode ^
        itemCount.hashCode;
  }
}
