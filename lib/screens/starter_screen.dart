import 'dart:ui';

import 'package:car_app/screens/home_screen.dart';
import 'package:car_app/screens/login_screen.dart';
import 'package:car_app/shared/navigation.dart';
import 'package:car_app/widgets/button_modal.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slide_to_act/slide_to_act.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 66, 66, 66),
                Color.fromARGB(255, 49, 51, 53)
              ],
              stops: [0.25, 0.75],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 140,
                            ),
                            const Text(
                              "Luxury Car Rental",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud e",
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 16),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned.fill(
                        right: -20,
                        top: -330,
                        child: Image.asset(
                          "images/car2.png",
                          width: 200,
                          height: 512,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SlideAction(
                  onSubmit: () {
                    goToScreen(context, HomeScreen());
                  },
                  sliderRotate: false,
                  sliderButtonIcon: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
