import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[300],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset(
              'assets/animations/Animation - 1698565530475.json',
              width: 500, // Genişlik
              height: 500, // Yükseklik
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                ' PAGE _ 1 ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
