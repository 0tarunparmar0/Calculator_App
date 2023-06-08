// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;
  const MyButton(
      {this.color,
      this.textColor,
      required this.buttonText,
      this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                color: color,
                child: Center(
                    child: Text(
                  buttonText,
                  style: TextStyle(color: textColor, fontSize: 20),
                )))),
      ),
    );
  }
}
