import 'package:car_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../shared/form_field.dart';
import '../shared/navigation.dart';
import 'home_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset("images/freed.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  inputField(
                    "Enter Name",
                    Icons.person,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  inputField("Enter Email", Icons.lock),
                  const SizedBox(
                    height: 20,
                  ),
                  inputField(
                      "Enter Password", Icons.lock, Icons.remove_red_eye),
                  const SizedBox(
                    height: 20,
                  ),
                  inputField(
                      "Confirm Password", Icons.lock, Icons.remove_red_eye),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {goToScreen(context, HomeScreen())},
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(55),
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Or",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account ?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            goToScreen(context, const LoginScreen());
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
