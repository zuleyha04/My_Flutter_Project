import 'package:flutter/material.dart';
import 'package:my_to_do_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.indigo[200],
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //TextField
            TextField(
              maxLength: 28,
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new Task"),
            ),

            //Buttons = save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(
                  width: 5,
                ),
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
