import 'package:flutter/material.dart';

TextFormField inputField(String labelText, IconData prefixIcon,
    [IconData? suffixIcon]) {
  return TextFormField(
    decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon)),
  );
}
