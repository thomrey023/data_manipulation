// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final String name;
  double price;
  ProductModel({
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

final productList = [
  ProductModel(name: 'Smartphone', price: 12000),
  ProductModel(name: 'Laptop', price: 60000),
  ProductModel(name: 'Headphones', price: 3000),
  ProductModel(name: 'Tablet', price: 7000),
  ProductModel(name: 'Smartwatch', price: 1500),
];
