import 'package:car_app/helper/color_pair.dart';
import 'package:car_app/model/item_model.dart';
import 'package:car_app/provider/item_provider.dart';
import 'package:car_app/widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AvailableCarCard extends StatelessWidget {
  const AvailableCarCard({
    super.key,
    required this.id,
    required this.name,
    required this.imageName,
    required this.price,
    required this.status,
  });

  final String imageName;
  final String name;
  final int price;
  final String status;
  final int id;

  @override
  Widget build(BuildContext context) {
    ColorPair statusColor = getStatusColor(status);
    final items = context.watch<ItemProvider>().items;
    Item item = items.firstWhere((element) => element.id == id, orElse: () {
      throw Exception("Not found");
    });
    return SizedBox(
        child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            ProductImage(
              image: imageName,
              id: id,
            ),
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
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  NumberFormat.simpleCurrency(locale: "en_US", decimalDigits: 0)
                      .format(item.price),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
