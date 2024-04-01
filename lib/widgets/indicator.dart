import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator(
      {super.key, required this.currentValue, required this.index});
  final int currentValue;
  final int index;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        curve: Curves.easeIn,
        width: index == currentValue ? 40 : 14,
        height: 15,
        decoration: BoxDecoration(
            color: index == currentValue
                ? Theme.of(context).primaryColor
                : Colors.grey,
            borderRadius: BorderRadius.circular(20)),
        duration: Duration(milliseconds: 500));
  }
}
