import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showNotify(BuildContext context, String anim, String content, int typeNotify) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "",
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) {
        return Container();
      },
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: AlertDialog(
              backgroundColor: typeNotify == 200
                  ? Colors.white
                  : const Color.fromARGB(255, 242, 189, 186),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    anim,
                  ),
                  Text(
                    content,
                    style: TextStyle(
                        fontSize: 20,
                        color: typeNotify == 200 ? Colors.blue : Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none),
            ),
          ),
        );
      });
}
