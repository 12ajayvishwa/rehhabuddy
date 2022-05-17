import 'package:flutter/material.dart';

class AppoinmentData {
  String imgUrl;
  String title;
  Color color;
  AppoinmentData(this.imgUrl, this.title, this.color);
}

List<AppoinmentData> appoinmentData = [
  AppoinmentData("assets/images/stethoscope.png", "UPLOAD YOUR ASSESSMENT",
      Color.fromARGB(255, 183, 190, 249)),
  AppoinmentData(
      "assets/images/teath.png", "TAKE A SELF ASSESSMENT", Color(0xFFFF7854)),
  AppoinmentData("assets/images/medicine 1.png",
      "APPOINTMENT FOR ONLINE ASSESSMENT", Color(0xFF68EEBE))
];
