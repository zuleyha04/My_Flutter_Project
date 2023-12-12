import 'package:cafe_app0/utility/paddingsAndMarjins.dart';
import 'package:flutter/material.dart';
import 'utility/Assetler.dart';
import 'utility/Butonlar.dart';
import 'utility/Textler.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AssetClass.resim1,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: paddingUtility().pagePaddingElli,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnaText(),
                  YardimciText(),
                  const SizedBox(
                    height: 20,
                  ),
                  GirisElevatedButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


