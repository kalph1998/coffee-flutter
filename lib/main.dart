import 'package:coffee/pages/coffee_page.dart';
import 'package:coffee/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.orange),
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        CoffeePage.routeName: (_) => const CoffeePage()
      },
    );
  }
}
