import 'package:car_app/provider/item_provider.dart';
import 'package:car_app/screens/starter_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ItemProvider>(
    child: const MyApp(),
    create: (_) => ItemProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clothes Shop",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color(0xFF2196F3)),
      home: StarterScreen(),
    );
  }
}
