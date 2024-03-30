import 'package:clothes_app/screens/forgot_screen.dart';
import 'package:clothes_app/screens/nagivation_screen.dart';
import 'package:clothes_app/screens/signup_screen.dart';
import 'package:clothes_app/shared/form_field.dart';
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPassScreen()));
                        },
                        child: const Text(
                          "Forgot password",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFFEF6969)),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavigationScreen()))
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(55),
                        backgroundColor: const Color(0xFFEF6969),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFFEF6969)),
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
