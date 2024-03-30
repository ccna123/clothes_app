// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "images/car1.jpg",
      "images/car2.jpg",
      "images/car3.jpg",
      "images/car4.jpg",
      "images/car5.jpg",
      "images/car6.jpg",
    ];
    List<Color> clrs = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
    ];

    int quantity = 0;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                  child: FanCarouselImageSlider(
                      sliderHeight: 400,
                      autoPlay: false,
                      imagesLink: images,
                      isAssets: true)),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shirt",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Lorem ipsum dolor sitcididunt ut",
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.7)),
                              ),
                              SizedBox(height: 10),
                              RatingBar.builder(
                                itemSize: 30,
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ],
                          ),
                          Text(
                            "\$300",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: Icon(
                              Icons.shopping_cart,
                              color: Color(0xFFEF6969),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showBottomModal(context, clrs, quantity);
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 1.5,
                              decoration: BoxDecoration(
                                color: Color(0xFFEF6969),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                "Buy now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showBottomModal(
      BuildContext context, List clrs, int quantity) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext builder) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Color",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        for (var i = 0; i < clrs.length; i++) ...[
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: clrs[i],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          )
                        ],
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              if (quantity > 0) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              size: 20,
                              color: Colors.black,
                            )),
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
