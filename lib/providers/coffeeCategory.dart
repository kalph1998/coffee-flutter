import 'package:flutter/cupertino.dart';

class CoffeeCategory with ChangeNotifier {
  final dynamic id;
  final String title;
  final String description;
  bool isSelected;

  CoffeeCategory(
      {required this.id,
      required this.title,
      required this.description,
      this.isSelected = false});
}
