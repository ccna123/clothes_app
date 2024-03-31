// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:car_app/model/item_model.dart';
import 'package:car_app/provider/item_provider.dart';
import 'package:car_app/screens/product_screen.dart';
import 'package:car_app/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> tabs = ["All", "Category", "Top", "Recommended"];

  @override
  Widget build(BuildContext context) {
    var items = context.watch<ItemProvider>().items;
    return Scaffold(
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
                            color: Color(0xFFEF6969),
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
                height: 250,
                // color: Color.fromARGB(255, 232, 142, 142),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ItemCard(
                        item: item,
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Latest Products",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.6),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ItemCard(item: item),
                    );
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
