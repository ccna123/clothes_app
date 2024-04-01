// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:car_app/helper/color_pair.dart';
import 'package:car_app/model/item_model.dart';
import 'package:car_app/provider/item_provider.dart';
import 'package:car_app/screens/product_screen.dart';
import 'package:car_app/widgets/item_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> tabs = ["All", "Category", "Top", "Recommended"];

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemProvider>().items;
    // List<String> imageName = [
    //   "images/car1.png",
    //   "images/car2.png",
    //   "images/car3.png",
    //   "images/car4.png"
    // ];
    // List<Map<String, dynamic>> listCars = [
    //   {"name": "Car 1", "status": "Available", "price": 12234},
    //   {"name": "Car 2", "status": "Sold out", "price": 42554},
    //   {"name": "Car 3", "status": "Is comming", "price": 99034},
    //   {"name": "Car 4", "status": "Available", "price": 51234},
    // ];
    int currentValue = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.06),
                              blurRadius: 1,
                              spreadRadius: 1)
                        ]),
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.sizeOf(context).width / 1.5,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Find product",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).primaryColor,
                          )),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.06),
                              blurRadius: 1,
                              spreadRadius: 1)
                        ]),
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.sizeOf(context).width / 6,
                    height: 50,
                    child: Icon(Icons.notifications),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 241, 216, 196),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(5),
                width: MediaQuery.sizeOf(context).width,
                height: 150,
                child: Image.asset("images/freed.png"),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: tabs.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, item) {
                      return FittedBox(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.only(left: 10, right: 15),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 40,
                          child: Center(
                            child: FittedBox(child: Text(tabs[item])),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 190,
                // color: Color.fromARGB(255, 232, 142, 142),
                child: StatefulBuilder(
                  builder: (BuildContext context, setState) {
                    return Column(
                      children: [
                        CarouselSlider(
                            options: CarouselOptions(
                              viewportFraction: 1,
                              aspectRatio: 2.6,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentValue = index;
                                });
                              },
                            ),
                            items: List<Widget>.generate(
                                    items.length,
                                    (index) =>
                                        ProductImage(image: items[index].image))
                                .toList()),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List<Widget>.generate(
                                items.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: PageIndicator(
                                        index: index,
                                        currentValue: currentValue,
                                      ),
                                    )),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Available Cars",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return AvailableCarCard(
                          name: items[index].name,
                          imageName: items[index].image,
                          price: items[index].price,
                          status: items[index].status);
                    }),
              )
            ],
          ),
        )),
      ),
    );
  }
}

ColorPair getStatusColor(String status) {
  switch (status) {
    case "Available":
      return ColorPair(backgroundColor: Colors.green);
    case "Comming":
      return ColorPair(backgroundColor: Colors.blue);
    case "Sold out":
      return ColorPair(backgroundColor: Colors.red);
    default:
      return ColorPair(backgroundColor: Colors.grey);
  }
}

class AvailableCarCard extends StatelessWidget {
  const AvailableCarCard({
    super.key,
    required this.name,
    required this.imageName,
    required this.price,
    required this.status,
  });

  final String imageName;
  final String name;
  final int price;
  final String status;

  @override
  Widget build(BuildContext context) {
    ColorPair statusColor = getStatusColor(status);
    return SizedBox(
        child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            ProductImage(image: imageName),
            Positioned(
              right: 10,
              bottom: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: statusColor.backgroundColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    status,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Text(
                  "\$${price.toString()}",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator(
      {super.key, required this.currentValue, required this.index});
  final int currentValue;
  final int index;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        curve: Curves.easeIn,
        width: index == currentValue ? 40 : 14,
        height: 15,
        decoration: BoxDecoration(
            color: index == currentValue
                ? Theme.of(context).primaryColor
                : Colors.grey,
            borderRadius: BorderRadius.circular(20)),
        duration: Duration(milliseconds: 500));
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [Color(0xffa8cdf5), Color(0xff499eee)],
            stops: const [0.25, 0.75],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          )),
    );
  }
}
