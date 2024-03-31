import 'package:car_app/screens/forgot_screen.dart';
import 'package:car_app/screens/nagivation_screen.dart';
import 'package:car_app/screens/signup_screen.dart';
import 'package:car_app/shared/form_field.dart';
import 'package:car_app/shared/navigation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  inputField("Enter Email", Icons.email),
                  const SizedBox(
                    height: 20,
                  ),
                  inputField(
                      "Enter Password", Icons.lock, Icons.remove_red_eye),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          goToScreen(context, const ForgotPassScreen());
                        },
                        child: Text(
                          "Forgot password",
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        {goToScreen(context, const NavigationScreen())},
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(55),
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
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
                        "Don't have an account ?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            goToScreen(context, const SignUpScreen());
                          },
                          child: Text(
                            "Sign in",
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
