import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rehabbudy/screens/onboarding_screen/onboarding_screen.dart';
import 'package:rehabbudy/utils/constant/background.dart';
import 'bottom_box.dart';
import 'center_image.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnBoardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: backgroundImage(),
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            right: 0,
            top: 205,
            bottom: 220,
            child: CenterImage(),
          ),
          Positioned(
            top: size.height * 0.88,
            child: BottomBox(size: size),
          ),
        ],
      ),
    );
  }
}
