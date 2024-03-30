import 'package:flutter/material.dart';

class ButtonModal extends StatelessWidget {
  final Color? bgColor;
  final String title;
  final double? containerWidth;

  const ButtonModal(
      {super.key, this.bgColor, required this.title, this.containerWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: containerWidth,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      )),
    );
  }
}
