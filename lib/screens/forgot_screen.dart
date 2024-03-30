// ignore_for_file: prefer_const_constructors

import 'package:car_app/screens/recovery_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/navigation.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  bool clearBtn = false;

  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

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
                  "Forgot password",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Please enter email to recover password. You will recieve a link to recover password",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 30),
              TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email";
                    }
                    return null;
                  },
                  controller: controller,
                  onChanged: (value) {
                    if (value != "") {
                      setState(() {
                        clearBtn = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            controller.text = "";
                          });
                        },
                        child: Icon(
                          CupertinoIcons.multiply,
                          color: Colors.red,
                        ),
                      ),
                      labelText: "Email",
                      border: OutlineInputBorder())),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => {goToScreen(context, RecoveryScreen())},
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(55),
                    backgroundColor: const Color(0xFFEF6969),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text(
                  "Send code",
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
