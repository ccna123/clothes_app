import 'package:car_app/model/item_model.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> initialData = [
  {
    "id": 1,
    "image": "images/car1.png",
    "name": "Car 1",
    "price": 24433,
    "likes": 5255,
    "status": "Available",
    "description": "this is car 1",
    "spec": {"fuel": 40, "speed": 230, "capacity": 2}
  },
  {
    "id": 2,
    "image": "images/car2.png",
    "name": "Car 2",
    "price": 29323,
    "likes": 1234,
    "status": "Available",
    "description": "this is car 2",
    "spec": {"fuel": 35, "speed": 330, "capacity": 2}
  },
  {
    "id": 3,
    "image": "images/car3.png",
    "name": "Car 3",
    "price": 90033,
    "likes": 2211,
    "status": "Comming",
    "description": "this is car 3",
    "spec": {"fuel": 13, "speed": 444, "capacity": 2}
  },
  {
    "id": 4,
    "image": "images/car4.png",
    "name": "Car 4",
    "price": 95037,
    "likes": 5465,
    "status": "Sold out",
    "description": "this is car 4",
    "spec": {"fuel": 14, "speed": 554, "capacity": 2}
  }
];

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];

  ItemProvider() {
    _items = initialData
        .map((e) => Item(
            id: e['id'],
            name: e['name'],
            status: e['status'],
            description: e['description'],
            image: e['image'],
            price: e['price'],
            spec: e['spec'],
            likes: e['likes']))
        .toList();
  }

  List<Item> get items => _items;
}
