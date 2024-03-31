import 'package:car_app/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final List<Map<String, dynamic>> initialData = [
  {
    "image": "images/car1.jpg",
    "name": "Car1",
    "price": 123,
    "likes": 5255,
    "description": "this is car 1"
  },
  {
    "image": "images/car2.jpg",
    "name": "Car2",
    "price": 1223,
    "likes": 1234,
    "description": "this is car 2"
  },
  {
    "image": "images/car3.jpg",
    "name": "Car3",
    "price": 23,
    "likes": 2211,
    "description": "this is car 3"
  },
  {
    "image": "images/car4.jpg",
    "name": "Car4",
    "price": 87,
    "likes": 5465,
    "description": "this is car 4"
  },
  {
    "image": "images/car5.jpg",
    "name": "Car5",
    "price": 827,
    "likes": 8292,
    "description": "this is car 5"
  },
  {
    "image": "images/car6.jpg",
    "name": "Car6",
    "price": 187,
    "likes": 4555,
    "description": "this is car 6"
  },
];

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];

  ItemProvider() {
    _items = initialData
        .map((e) => Item(
            name: e['name'],
            description: e['description'],
            image: e['image'],
            price: e['price'],
            likes: e['likes']))
        .toList();
  }

  List<Item> get items => _items;
}
