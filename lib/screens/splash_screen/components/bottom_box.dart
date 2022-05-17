import 'package:flutter/material.dart';

class BottomBox extends StatelessWidget {
  const BottomBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.150,
      width: size.width,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.85),
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(170, 95),
          topRight: Radius.elliptical(170, 95),
        ),
      ),
      child: const Center(
        child: Text(
          "India’s First Multidisciplinary\nTele-Rehabilitation Platform ",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              fontFamily: "OpenSans",
              fontWeight: FontWeight.w600,
              color: Color(0XFF0089FF)),
        ),
      ),
    );
  }
}