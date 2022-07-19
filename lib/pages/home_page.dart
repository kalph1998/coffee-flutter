// ignore_for_file: prefer_const_constructors

import 'package:coffee/providers/coffeeCategory.dart';
import 'package:coffee/providers/coffees.dart';
import 'package:coffee/util/coffee_tile.dart';
import 'package:coffee/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isInit = true;
  var _isLoading = false;
  var _isLoadingCoffee = false;
  List coffeeCategory = [];

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Coffees>(context).fetchCoffeeCategory().then(
            (value) => setState(() {
              _isLoading = false;
              _isLoadingCoffee = false;
            }),
          );
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  void coffeeTypeSelected(int index, List<CoffeeCategory> categoryArray) {
    for (int i = 0; i < categoryArray.length; i++) {
      categoryArray[i].isSelected = false;
    }
    setState(() {
      categoryArray[index].isSelected = true;
    });
  }

  Future<void> getSelectedCategoryCoffees(String id) async {
    setState(() {
      _isLoadingCoffee = true;
    });
    await Provider.of<Coffees>(context, listen: false)
        .fetchCoffeesByCategoryId(id);
    setState(() {
      _isLoadingCoffee = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var category =
        Provider.of<Coffees>(context, listen: false).coffeeCategories;
    var coffees = Provider.of<Coffees>(context, listen: false).coffees;
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
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                        itemCount: category.length,
                        itemBuilder: (context, index) {
                          return CoffeeType(
                              coffeeType: category[index].title,
                              isSelected: category[index].isSelected,
                              onTap: () async {
                                await getSelectedCategoryCoffees(
                                    category[index].id);
                                coffeeTypeSelected(index, category);
                              });
                        },
                        scrollDirection: Axis.horizontal),
                  ),

                  //horizontal list view
                  _isLoadingCoffee
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(
                          height: 320,
                          child: ListView.builder(
                            itemCount: coffees.length,
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CoffeeTile(
                                coffeeImage: coffees[index].imageUrl,
                                coffeeName: coffees[index].title,
                                coffeeMilk: coffees[index].milk,
                                coffeePrice: coffees[index].price,
                                coffeeRating: coffees[index].rating,
                                coffeeId: coffees[index].id,
                              );
                            },
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
