import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[300],
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                ' PAGE _ 2 ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: Colors.white,),
              ),
            ),
            Lottie.asset(
              'assets/animations/Animation - 1698574718761.json',
              width: 500, // Genişlik
              height: 400, // Yükseklik
              fit: BoxFit.contain,
            ),
          ],
        ),);
  }
}
