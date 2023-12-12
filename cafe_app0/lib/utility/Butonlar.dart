import 'package:cafe_app0/product_Page.dart';
import 'package:flutter/material.dart';

ElevatedButton GirisElevatedButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductPage(),
          ));
    },
    style: ButtonStyle(
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.white),
      foregroundColor: MaterialStateProperty.all(Colors.black),
    ),
    child: const Text('Devam Et'),
  );
}
