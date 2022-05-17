import 'package:flutter/material.dart';

class LastPageWidget extends StatelessWidget {
  const LastPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(
            text: "Rehab Buddy",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              fontFamily: "OpenSans",
              color: Color(0xFFA61919),
            ),
            children: <TextSpan>[
          TextSpan(
            text: " Gold",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              fontFamily: "OpenSans",
              color: Color(0xFFD4AF37),
            ),
          )
        ]));
  }
}
