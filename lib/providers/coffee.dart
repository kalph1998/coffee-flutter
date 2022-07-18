import 'package:flutter/cupertino.dart';

class Coffee with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final num price;
  final String imageUrl;
  final String milk;
  final double rating;
  final String categoryId;

  Coffee(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.milk,
      required this.rating,
      required this.categoryId});
}
