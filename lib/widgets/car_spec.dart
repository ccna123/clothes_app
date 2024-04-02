import 'package:flutter/material.dart';

class CarSpec extends StatelessWidget {
  const CarSpec(
      {super.key,
      required this.title,
      required this.icon,
      required this.specNumber,
      required this.unit});

  final String title;
  final Widget icon;
  final int specNumber;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.09),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            const SizedBox(
              height: 5,
            ),
            Text(title),
            const SizedBox(
              height: 15,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: specNumber.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              TextSpan(text: unit, style: const TextStyle(color: Colors.black))
            ]))
          ],
        ),
      ),
    );
  }
}
