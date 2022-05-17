import 'package:flutter/material.dart';
import 'components/body.dart';

class OtpVerification extends StatelessWidget {
  final String phoneNumber;
  // ignore: use_key_in_widget_constructors
  const OtpVerification(this.phoneNumber);

  @override
  Widget build(BuildContext context) {
    return Body(phoneNumber);
  }
}
