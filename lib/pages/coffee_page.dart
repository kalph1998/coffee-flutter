import 'dart:ui';

import 'package:coffee/providers/coffee.dart';
import 'package:coffee/providers/coffees.dart';
import 'package:coffee/util/coffee_details.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CoffeePage extends StatefulWidget {
  static const routeName = '/coffee';
  const CoffeePage({Key? key}) : super(key: key);

  @override
  State<CoffeePage> createState() => _CoffeePageState();
}

class _CoffeePageState extends State<CoffeePage> {
  late Coffee coffeeData;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final args = ModalRoute.of(context)!.settings.arguments;
    Provider.of<Coffees>(context, listen: false)
        .fetchCoffeeById(args as String)
        .then((value) => coffeeData = value);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => {Navigator.of(context).pop()},
            child: Icon(
              Icons.navigate_before,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.favorite),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(children: [
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '\$ ',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 20),
                          ),
                          TextSpan(
                            text: '4.20',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () => {},
                  child: Text(
                    'Buy Now',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            )
          ]),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      'lib/images/cap.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: CoffeeDetails(),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy',
                      style: TextStyle(fontSize: 14, color: Colors.grey[300]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Size',
                      style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomRadioButton(
                      elevation: 0,
                      absoluteZeroSpacing: false,
                      buttonLables: ['S', 'M', 'L'],
                      buttonValues: ['small', 'medium', 'large'],
                      selectedBorderColor: Colors.orange[600],
                      defaultSelected: 'medium',
                      buttonTextStyle: ButtonTextStyle(
                        selectedColor: Colors.orange[600]!,
                        unSelectedColor: Colors.grey[400]!,
                        textStyle: TextStyle(fontSize: 14),
                      ),
                      radioButtonValue: (value) {
                        print(value);
                      },
                      unSelectedColor: Colors.black38,
                      enableShape: true,
                      selectedColor: Colors.black45,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
