import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[300],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset(
              'assets/animations/Animation - 1698575161385.json',
              width: 500, // Genişlik
              height: 500, // Yükseklik
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                ' PAGE _ 3 ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: Colors.white,),
              ),
            ),
          ],
        ),
      ));
  }
}
