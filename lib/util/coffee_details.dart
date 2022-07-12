import 'dart:ui';

import 'package:flutter/material.dart';

class CoffeeDetails extends StatelessWidget {
  const CoffeeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black38,
          padding: const EdgeInsets.all(20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Cappuccino',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'With Oat Milk',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          text: '4.5',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' (6,986)',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        )
                      ]),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 55,
                      height: 62,
                      padding: const EdgeInsets.all(9),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.coffee,
                            color: Colors.orange,
                            size: 20,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Coffee',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500]),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      width: 55,
                      height: 62,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.water_drop,
                            color: Colors.orange,
                            size: 20,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Milk',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black54,
                  ),
                  child: Text(
                    'Medium Roasted',
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
