import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id, quantity;
  final Color color;

  Product(
      {required this.image,
        required this.title,
        required this.description,
        required this.price,
        required this.size,
        required this.id,
        required this.color,
        required this.quantity,
      });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Shoe",
      price: 1200,
      size: 12,
      description: "Shoes",
      image: "assets/1.png",
      quantity: 1,
      color: Colors.transparent),
  Product(
      id: 2,
      title: "Dress",
      price: 234,
      size: 8,
      description: "Dress",
      image: "assets/2.png",
      quantity: 2,
      color: Colors.transparent),
  Product(
      id: 3,
      title: "Shirt",
      price: 234,
      size: 10,
      description: "Shirt",
      image: "assets/3.png",
      quantity: 3,
      color: Colors.transparent),
  Product(
      id: 4,
      title: "Jacket",
      price: 234,
      size: 11,
      description: "Jacket",
      image: "assets/4.png",
      quantity: 4,
      color: Colors.transparent),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";