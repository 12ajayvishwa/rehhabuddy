import 'package:flutter/material.dart';

class BoxField extends StatelessWidget {
  final String text;
  final IconData icon;

  const BoxField(this.text, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.9,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromRGBO(147, 216, 255, 0.3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              icon,
              color: const Color(0xFF808080),
              size: 25,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: Color(0xFF808080)),
          )
        ],
      ),
    );
  }
}
