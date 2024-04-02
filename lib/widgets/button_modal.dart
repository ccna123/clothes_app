import 'package:flutter/material.dart';

class ButtonModal extends StatelessWidget {
  final Color? bgColor;
  final String title;
  final double? containerWidth;
  final Color textColor;

  const ButtonModal({
    super.key,
    this.bgColor,
    required this.title,
    this.containerWidth,
    this.textColor = Colors.white,
  });

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
        style: TextStyle(
            color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
      )),
    );
  }
}
