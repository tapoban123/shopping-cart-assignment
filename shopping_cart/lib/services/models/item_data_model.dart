// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemDataModel {
  final int id;
  final String thumbnail;
  final String title;
  final String? brand;
  final double price;
  final double discountPercentage;
  final double? itemNewPrice;

  ItemDataModel({
    required this.id,
    required this.thumbnail,
    required this.title,
    required this.brand,
    required this.price,
    required this.discountPercentage,
    this.itemNewPrice,
  });

  ItemDataModel copyWith({
    int? id,
    String? thumbnail,
    String? title,
    String? brand,
    double? price,
    double? discountPercentage,
    double? itemNewPrice,
  }) {
    return ItemDataModel(
      id: id ?? this.id,
      thumbnail: thumbnail ?? this.thumbnail,
      title: title ?? this.title,
      brand: brand ?? this.brand,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      itemNewPrice: itemNewPrice ?? this.itemNewPrice,
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
    };
  }

  factory ItemDataModel.fromMap(Map<String, dynamic> map) {
    return ItemDataModel(
      id: map['id'] as int,
      thumbnail: map['thumbnail'] as String,
      title: map['title'] as String,
      brand: map['brand'] != null ? map['brand'] as String : null,
      price: map['price'].toDouble(),
      discountPercentage: map['discountPercentage'].toDouble(),
      itemNewPrice:
          map['itemNewPrice'] != null ? map['itemNewPrice'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemDataModel.fromJson(String source) =>
      ItemDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemDataModel(id: $id, thumbnail: $thumbnail, title: $title, brand: $brand, price: $price, discountPercentage: $discountPercentage, itemNewPrice: $itemNewPrice)';
  }

  @override
  bool operator ==(covariant ItemDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.thumbnail == thumbnail &&
        other.title == title &&
        other.brand == brand &&
        other.price == price &&
        other.discountPercentage == discountPercentage &&
        other.itemNewPrice == itemNewPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        thumbnail.hashCode ^
        title.hashCode ^
        brand.hashCode ^
        price.hashCode ^
        discountPercentage.hashCode ^
        itemNewPrice.hashCode;
  }
}
