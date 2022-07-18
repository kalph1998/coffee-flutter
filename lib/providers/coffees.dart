import 'dart:convert';

import 'package:coffee/providers/coffee.dart';
import 'package:coffee/providers/coffeeCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Coffees with ChangeNotifier {
  List<Coffee> _coffee = [];
  List<CoffeeCategory> _coffeeCategory = [];

  List<CoffeeCategory> get coffeeCategories {
    return [..._coffeeCategory];
  }

  List<Coffee> get coffees {
    return [..._coffee];
  }

  Future<void> fetchCoffeeCategory() async {
    final url = Uri.parse('https://kalph-coffee.herokuapp.com/category');

    final response = await http.get(url);

    final extractedData = json.decode(response.body) as List<dynamic>;
    final List<CoffeeCategory> loadedCategory = [];

    for (var coffeeCategory in extractedData) {
      loadedCategory.add(
        CoffeeCategory(
          description: coffeeCategory['description'],
          title: coffeeCategory['categoryName'],
          id: coffeeCategory['_id'],
        ),
      );
    }

    loadedCategory[0].isSelected = true;
    await fetchCoffeesByCategoryId(loadedCategory[0].id);
    _coffeeCategory = loadedCategory;
  }

  Future<void> fetchCoffeesByCategoryId(String id) async {
    final url = Uri.parse('https://kalph-coffee.herokuapp.com/coffee/$id');

    final response = await http.get(url);

    final extractedData = json.decode(response.body) as List<dynamic>;
    final List<Coffee> loadedCoffees = [];
    for (var coffee in extractedData) {
      loadedCoffees.add(
        Coffee(
            id: coffee['_id'],
            title: coffee['name'],
            description: coffee['description'],
            price: coffee['price'],
            imageUrl: coffee['image'],
            milk: coffee['milk'],
            rating: coffee['rating'],
            categoryId: coffee['category']),
      );
    }
    _coffee = loadedCoffees;
  }

  Future<Coffee> fetchCoffeeById(String id) async {
    final url =
        Uri.parse('https://kalph-coffee.herokuapp.com/singleCoffee/$id');

    final response = await http.get(url);

    final extractedData = json.decode(response.body);
    print(extractedData);

    return extractedData as Coffee;
  }
}
