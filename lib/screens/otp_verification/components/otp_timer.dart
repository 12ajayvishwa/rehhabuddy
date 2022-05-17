import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountDown extends AnimatedWidget {
  const CountDown({Key? key, required this.animation})
      : super(key: key, listenable: animation);

  final Animation<int> animation;

  @override
  Widget build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Text(
      timerText,
      style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF666666)),
    );
  }
}
