import 'package:flutter/material.dart';

class ColorPair {
  final Color backgroundColor;

  ColorPair({required this.backgroundColor});
}

ColorPair getStatusColor(String status) {
  switch (status) {
    case "Available":
      return ColorPair(backgroundColor: Colors.green);
    case "Comming":
      return ColorPair(backgroundColor: Colors.blue);
    case "Sold out":
      return ColorPair(backgroundColor: Colors.red);
    default:
      return ColorPair(backgroundColor: Colors.grey);
  }
}
