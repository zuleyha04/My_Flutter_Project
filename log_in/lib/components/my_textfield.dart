import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obsureText;


  const MyTextField({super.key, this.controller, required this.hintText, required this.obsureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obsureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          fillColor: Colors.white54,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[600],),
        ),
      ),
    );
  }
}
