// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:car_app/provider/item_provider.dart';
import 'package:car_app/widgets/available_car.dart';
import 'package:car_app/widgets/indicator.dart';
import 'package:car_app/widgets/product_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> tabs = ["All", "Category", "Top", "Recommended"];

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemProvider>().items;

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
                                (index) => ProductImage(
                                      image: items[index].image,
                                      id: items[index].id,
                                    )).toList()),
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
                          id: items[index].id,
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
