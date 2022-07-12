// ignore_for_file: prefer_const_constructors

import 'package:coffee/util/coffee_tile.dart';
import 'package:coffee/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeTypes = [
    ['Cappuccino', true],
    ['Latte', false]
  ];

  void coffeeTypeSelected(int index) {
    for (int i = 0; i < coffeeTypes.length; i++) {
      coffeeTypes[i][1] = false;
    }
    setState(() {
      coffeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.person),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Find the best coffee for you",
                style: GoogleFonts.notoSans(
                  fontSize: 40,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //search field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee..',
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //horizontal list view of coffee tiles
            Container(
              height: 50,
              child: ListView.builder(
                  itemCount: coffeeTypes.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                        coffeeType: coffeeTypes[index][0],
                        isSelected: coffeeTypes[index][1],
                        onTap: () {
                          coffeeTypeSelected(index);
                        });
                  },
                  scrollDirection: Axis.horizontal),
            ),

            //horizontal list view
            SizedBox(
              height: 320,
              child: ListView(
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                children: [
                  CoffeeTile(
                      coffeeImage: 'lib/images/cap.jpg',
                      coffeeName: 'cappuccino',
                      coffeeMilk: 'oat',
                      coffeePrice: 5),
                  CoffeeTile(
                      coffeeImage: 'lib/images/cap2.jpg',
                      coffeeName: 'cappuccino',
                      coffeeMilk: 'goat',
                      coffeePrice: 5),
                  CoffeeTile(
                      coffeeImage: 'lib/images/lat.jpg',
                      coffeeName: 'cappuccino',
                      coffeeMilk: 'Almond',
                      coffeePrice: 3),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Special for you',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 25),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black54,
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'lib/images/lat.jpg',
                          fit: BoxFit.cover,
                          width: 120,
                          height: 120,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          "5 Coffee Beans you must try!",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
