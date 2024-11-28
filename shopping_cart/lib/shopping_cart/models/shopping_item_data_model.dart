// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ShoppingItemDataModel {
  final int id;
  final String thumbnail;
  final String title;
  final String brand;
  final double discountPercentage;
  final double? itemNewPrice;
  
  ShoppingItemDataModel({
    required this.id,
    required this.thumbnail,
    required this.title,
    required this.brand,
    required this.discountPercentage,
    this.itemNewPrice,
  });

  ShoppingItemDataModel copyWith({
    int? id,
    String? thumbnail,
    String? title,
    String? brand,
    double? discountPercentage,
    double? itemNewPrice,
  }) {
    return ShoppingItemDataModel(
      id: id ?? this.id,
      thumbnail: thumbnail ?? this.thumbnail,
      title: title ?? this.title,
      brand: brand ?? this.brand,
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
      'discountPercentage': discountPercentage,
      'itemNewPrice': itemNewPrice,
    };
  }

  factory ShoppingItemDataModel.fromMap(Map<String, dynamic> map) {
    return ShoppingItemDataModel(
      id: map['id'] as int,
      thumbnail: map['thumbnail'] as String,
      title: map['title'] as String,
      brand: map['brand'] as String,
      discountPercentage: map['discountPercentage'] as double,
      itemNewPrice: map['itemNewPrice'] != null ? map['itemNewPrice'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShoppingItemDataModel.fromJson(String source) => ShoppingItemDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShoppingItemDataModel(id: $id, thumbnail: $thumbnail, title: $title, brand: $brand, discountPercentage: $discountPercentage, itemNewPrice: $itemNewPrice)';
  }

  @override
  bool operator ==(covariant ShoppingItemDataModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.thumbnail == thumbnail &&
      other.title == title &&
      other.brand == brand &&
      other.discountPercentage == discountPercentage &&
      other.itemNewPrice == itemNewPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      thumbnail.hashCode ^
      title.hashCode ^
      brand.hashCode ^
      discountPercentage.hashCode ^
      itemNewPrice.hashCode;
  }
}
