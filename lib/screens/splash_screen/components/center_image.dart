import 'package:flutter/material.dart';

class CenterImage extends StatelessWidget {
  const CenterImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 414,
      width: 414,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.85),
        borderRadius: BorderRadius.circular(414),
      ),
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400),
        ),
        child: Image.asset("assets/logo/rehabbudy.png"),
      ),
    );
  }
}
