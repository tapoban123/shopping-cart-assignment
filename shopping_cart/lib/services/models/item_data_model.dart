// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemDataModel {
  final String thumbnail;
  final String title;
  final String brand;
  final double price;
  final double discountPercentage;
  final String? itemNewPrice;

  ItemDataModel({
    required this.thumbnail,
    required this.title,
    required this.brand,
    required this.price,
    required this.discountPercentage,
    this.itemNewPrice,
  });

  ItemDataModel copyWith({
    String? thumbnail,
    String? title,
    String? brand,
    double? price,
    double? discountPercentage,
    String? itemNewPrice,
  }) {
    return ItemDataModel(
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
      thumbnail: map['thumbnail'] as String,
      title: map['title'].toString(),
      brand: map['brand'].toString(),
      price: map['price'] as double,
      discountPercentage: map['discountPercentage'].toDouble(),
      itemNewPrice:
          map['itemNewPrice'] != null ? map['itemNewPrice'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemDataModel.fromJson(String source) =>
      ItemDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemDataModel(thumbnail: $thumbnail, title: $title, brand: $brand, price: $price, discountPercentage: $discountPercentage, itemNewPrice: $itemNewPrice)';
  }

  @override
  bool operator ==(covariant ItemDataModel other) {
    if (identical(this, other)) return true;

    return other.thumbnail == thumbnail &&
        other.title == title &&
        other.brand == brand &&
        other.price == price &&
        other.discountPercentage == discountPercentage &&
        other.itemNewPrice == itemNewPrice;
  }

  @override
  int get hashCode {
    return thumbnail.hashCode ^
        title.hashCode ^
        brand.hashCode ^
        price.hashCode ^
        discountPercentage.hashCode ^
        itemNewPrice.hashCode;
  }
}
