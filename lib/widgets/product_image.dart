import 'package:car_app/screens/product_screen.dart';
import 'package:car_app/shared/navigation.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToScreen(context, ProductScreen());
      },
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffa8cdf5), Color(0xff499eee)],
              stops: [0.25, 0.75],
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
      ),
    );
  }
}
