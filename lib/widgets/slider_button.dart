import 'package:car_app/helper/destination_enum.dart';
import 'package:car_app/screens/confirm_order_screen.dart';
import 'package:car_app/screens/home_screen.dart';
import 'package:car_app/shared/navigation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SliderButton extends StatelessWidget {
  const SliderButton(
      {super.key,
      required this.title,
      required this.destinationScreen,
      this.price});

  final String title;
  final DestinationScreen destinationScreen;
  final int? price;

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      onSubmit: () {
        navigateTo(context, price!);
      },
      sliderRotate: false,
      sliderButtonIcon: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      outerColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(left: 170),
        child: Shimmer.fromColors(
          baseColor: Colors.blue[100]!,
          highlightColor: Colors.blue[300]!,
          child: Row(
              children: List.generate(
            4,
            (index) => const Icon(
              size: 30,
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          )),
        ),
      ),
    );
  }

  void navigateTo(BuildContext context, int price) {
    switch (destinationScreen) {
      case DestinationScreen.HOME:
        goToScreen(context, HomeScreen());
        break;
      case DestinationScreen.CHECKOUT:
        goToScreen(context, (ConfirmOrderScreen(price: price)));
        break;
    }
  }
}
