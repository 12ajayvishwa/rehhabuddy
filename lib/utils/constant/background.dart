import 'package:flutter/material.dart';

BoxDecoration backgroundImage() {
  return const BoxDecoration(
    image: DecorationImage(
        opacity: 0.64,
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.blue, BlendMode.color),
        image: AssetImage("assets/images/background1.jpg")),
  );
}
