import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int price;
  final Color bgColor;

  Product({
    required this.image,
    required this.title,
    required this.price,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<Product> demo_product = [
  Product(
    image: "assets/images/nissan.jpg",
    title: "car",
    price: 300,
    bgColor: const Color(0xFFFEFBF9),
  ),
  Product(
    image: "assets/images/nissan.jpg",
    title: "car",
    price: 400,
  ),
  Product(
    image: "assets/images/sample.jpg",
    title: "300",
    price: 180,
    bgColor: const Color(0xFFF8FEFB),
  ),
  Product(
    image: "assets/images/sample.jpg",
    title: "Casual Nolin",
    price: 200,
    bgColor: const Color(0xFFEEEEED),
  ),
  Product(
    image: "assets/images/sample.jpg",
    title: "Casual Nolin",
    price: 200,
    bgColor: const Color(0xFFEEEEED),
  ),
  Product(
    image: "assets/images/sample.jpg",
    title: "Casual Nolin",
    price: 200,
    bgColor: const Color(0xFFEEEEED),
  ),
  Product(
    image: "assets/images/sample.jpg",
    title: "Casual Nolin",
    price: 200,
    bgColor: const Color(0xFFEEEEED),
  ),
  Product(
    image: "assets/images/sample.jpg",
    title: "Casual Nolin",
    price: 200,
    bgColor: const Color(0xFFEEEEED),
  ),
  Product(
    image: "assets/images/sample.jpg",
    title: "Casual Nolin",
    price: 200,
    bgColor: const Color(0xFFEEEEED),
  ),
  Product(
    image: "assets/images/sample.jpg",
    title: "Casual Nolin",
    price: 200,
    bgColor: const Color(0xFFEEEEED),
  ),
  Product(
    image: "assets/images/sample.jpg",
    title: "Casual Nolin",
    price: 200,
    bgColor: const Color(0xFFEEEEED),
  ),
  Product(
    image: "assets/images/sample.jpg",
    title: "Casual Nolin",
    price: 200,
    bgColor: const Color(0xFFEEEEED),
  ),
];