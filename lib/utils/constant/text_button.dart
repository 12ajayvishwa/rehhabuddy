import 'package:flutter/material.dart';

class TexttButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;
  final Color textColor;

  // ignore: use_key_in_widget_constructors
  const TexttButton(this.text, this.onPressed, this.textColor);

  get borderRadius => BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor),
      ),
    );
  }
}
