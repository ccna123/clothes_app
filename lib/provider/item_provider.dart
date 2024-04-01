import 'package:car_app/model/item_model.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> initialData = [
  {
    "image": "images/car1.png",
    "name": "Car 1",
    "price": 24433,
    "likes": 5255,
    "status": "Available",
    "description": "this is car 1"
  },
  {
    "image": "images/car2.png",
    "name": "Car 2",
    "price": 29323,
    "likes": 1234,
    "status": "Available",
    "description": "this is car 2"
  },
  {
    "image": "images/car3.png",
    "name": "Car 3",
    "price": 90033,
    "likes": 2211,
    "status": "Comming",
    "description": "this is car 3"
  },
  {
    "image": "images/car4.png",
    "name": "Car 4",
    "price": 95037,
    "likes": 5465,
    "status": "Sold out",
    "description": "this is car 4"
  }
];

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];

  ItemProvider() {
    _items = initialData
        .map((e) => Item(
            name: e['name'],
            status: e['status'],
            description: e['description'],
            image: e['image'],
            price: e['price'],
            likes: e['likes']))
        .toList();
  }

  List<Item> get items => _items;
}
