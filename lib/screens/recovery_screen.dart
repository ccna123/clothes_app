// ignore_for_file: prefer_const_constructors, unused_element
import 'package:car_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../shared/form_field.dart';
import '../shared/navigation.dart';

class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({super.key});

  @override
  State<RecoveryScreen> createState() => __RecoveryScreenState();
}

class __RecoveryScreenState extends State<RecoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Recovery password",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              inputField("Code", Icons.numbers, null),
              SizedBox(height: 30),
              inputField("New password", Icons.lock, Icons.remove_red_eye),
              SizedBox(height: 30),
              inputField(
                  "Confirm new password", Icons.lock, Icons.remove_red_eye),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => {goToScreen(context, HomeScreen())},
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(55),
                    backgroundColor: const Color(0xFFEF6969),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text(
                  "Reset password",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
