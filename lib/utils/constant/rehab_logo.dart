import 'package:flutter/material.dart';

class RehabLogo extends StatelessWidget {
  const RehabLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(170)),
      child: Center(
        child: Image.asset(
          "assets/logo/rehabbudy.png",
          height: 115,
          width: 115,
        ),
      ),
    );
  }
}
