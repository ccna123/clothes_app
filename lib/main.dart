import 'package:clothes_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clothes Shop",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color(0xFFEF6969)),
      home: const SplashScreen(),
    );
  }
}