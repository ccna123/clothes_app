import 'package:car_app/helper/color_pair.dart';
import 'package:car_app/widgets/product_image.dart';
import 'package:flutter/material.dart';

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
                    style: const TextStyle(
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
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Text(
                  "\$${price.toString()}",
                  style: const TextStyle(
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
