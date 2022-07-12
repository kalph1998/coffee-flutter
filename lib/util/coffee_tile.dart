import 'dart:ui';

import 'package:coffee/pages/coffee_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImage;
  final String coffeeName;
  final String coffeeMilk;
  final int coffeePrice;

  CoffeeTile(
      {required this.coffeeImage,
      required this.coffeeName,
      required this.coffeeMilk,
      required this.coffeePrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(CoffeePage.routeName);
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black54,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // image
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  coffeeImage,
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
                    child: Container(
                      color: Colors.black45,
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                text: '4.5',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),

            //text
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeName,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'with $coffeeMilk milk',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$ $coffeePrice.00'),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.orange,
                    ),
                    child: Icon(Icons.add),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
