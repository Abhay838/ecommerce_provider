import 'package:flutter/material.dart';

class ProductModel {
  final String title;
  final String description;
  final String image;
  final String review;
  final String seller;
  final int price;
  final List<Color> colors;
  final String category;
  final double rate;
  int quantity;

  ProductModel({
    required this.title,
    required this.description,
    required this.image,
    required this.review,
    required this.seller,
    required this.price,
    required this.colors,
    required this.category,
    required this.rate,
    required this.quantity,
  });
  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'image': image,
        'review': review,
        'seller': seller,
        'price': price,
        'colors': colors.map((color) => color.value).toList(),
        'category': category,
        'rate': rate,
        'quantity': quantity,
      };

  static ProductModel fromJson(Map<String, dynamic> json) => ProductModel(
        title: json['title'],
        description: json['description'],
        image: json['image'],
        review: json['review'],
        seller: json['seller'],
        price: json['price'],
        colors: (json['colors'] as List).map((color) => Color(color)).toList(),
        category: json['category'],
        rate: json['rate'],
        quantity: json['quantity'],
      );
}
