// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:car_app/helper/destination_enum.dart';
import 'package:car_app/model/item_model.dart';
import 'package:car_app/provider/item_provider.dart';
import 'package:car_app/widgets/car_spec.dart';
import 'package:car_app/widgets/slider_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemProvider>().items;
    items.map((item) => item.image).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                              text: NumberFormat.simpleCurrency(
                                      locale: 'en_US', decimalDigits: 0)
                                  .format(item.price)),
                          const TextSpan(
                              text: "/day",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))
                        ]))
                      ],
                    )),
                Image.asset(item.image),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Car Specs",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CarSpec(
                                      title: "Fuel info",
                                      icon: Icon(Icons.local_gas_station),
                                      specNumber: item.spec['fuel']!,
                                      unit: "L",
                                    ),
                                    CarSpec(
                                      title: "Top Speed",
                                      icon: Icon(Icons.speed),
                                      specNumber: item.spec['speed']!,
                                      unit: "mph",
                                    ),
                                    CarSpec(
                                      title: "Capacity",
                                      icon: Icon(Icons.person_3_outlined),
                                      specNumber: item.spec['capacity']!,
                                      unit: "seat(s)",
                                    ),
                                  ]),
                              SizedBox(height: 10),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                    size: 35,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    item.likes.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "um dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex e",
                        style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                      ),
                    ),
                    SizedBox(height: 20),
                    SliderButton(
                      title: "Rent now",
                      price: item.price,
                      destinationScreen: DestinationScreen.CHECKOUT,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
