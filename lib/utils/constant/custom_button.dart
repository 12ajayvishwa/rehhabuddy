import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;
  final BorderRadius radius;

  const CustomButton(
    this.text,
    this.onPressed,
    this.radius, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.065,
        width: size.width * 0.45,
        decoration: BoxDecoration(
          borderRadius: radius,
        ),
        child: Card(
          color: const Color(0xFF38B6FF),
          elevation: 5,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
