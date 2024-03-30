// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:clothes_app/screens/product_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> tabs = ["All", "Category", "Top", "Recommended"];
  List images = [
    "images/image1.jpg",
    "images/image2.jpg",
    "images/image3.jpg",
    "images/image4.jpg",
    "images/image5.jpg",
    "images/image6.jpg",
  ];
  List<String> products = [
    "Shirt",
    "Skirt",
    "Hat",
    "Shoe",
    "Underwear",
    "Bikini"
  ];
  List<String> price = ["\$123", "\$1223", "\$23", "\$87", "\$827", "\$187"];
  List<String> likes = ["555", "1234", "221", "55", "1223", "555"];

  @override
  Widget build(BuildContext context) {
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
              Container(
                height: 250,
                // color: Color.fromARGB(255, 232, 142, 142),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return itemCard(index, context);
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
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: itemCard(index, context),
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

  Padding itemCard(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            child: Stack(
              children: [
                InkWell(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      )),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductScreen()));
                  },
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            products[index],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Row(
            children: [
              Icon(
                Icons.thumb_up,
                color: Colors.blue[200],
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                likes[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.monetization_on,
                color: Colors.green,
              ),
              Text(
                price[index],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red),
              ),
            ],
          )
        ],
      ),
    );
  }
}
