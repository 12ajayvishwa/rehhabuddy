import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:rehabbudy/Services/auth_services.dart';
import 'package:rehabbudy/screens/login/login_screen.dart';
import 'package:rehabbudy/screens/otp_verification/components/otp_timer.dart';
import 'package:rehabbudy/utils/constant/custom_button.dart';
import 'package:rehabbudy/utils/constant/rehab_logo.dart';
import '../../../utils/constant/background.dart';
import '../../../utils/constant/text_button.dart';

class Body extends StatefulWidget {
  final String phoneNumber;
  const Body(this.phoneNumber, {Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  String verificationIdFinal = "";
  String smsCode = "";
  late AnimationController _controller;
  int levelClock = 60;
  final TextEditingController _phoneNumberController = TextEditingController();
  AuthClass authClass = AuthClass();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: backgroundImage(),
          child: Column(
            children: <Widget>[
              const Padding(
                  padding: EdgeInsets.only(top: 25), child: RehabLogo()),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: size.height * 0.55,
                width: size.width * 0.9,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  color: Colors.white,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: size.height * 0.05,
                        child: Image.asset(
                          "assets/images/lock.jpg",
                          height: 125,
                          width: 125,
                        ),
                      ),
                      Positioned(
                          top: size.height * 0.23,
                          child: Text(
                            "Verify +91-${widget.phoneNumber}",
                            style: const TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 20,
                                color: Color(0xFF666666)),
                          )),
                      Positioned(
                          top: size.height * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _textFieldOTP(),
                            ],
                          )),
                      Positioned(
                        bottom: size.height * 0.09,
                        right: 0.1,
                        child: SizedBox(
                          height: size.height * 0.08,
                          width: size.width * 0.75,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CountDown(
                                  animation:
                                      StepTween(begin: levelClock, end: 0)
                                          .animate(_controller),
                                ),
                                TexttButton("Resend OTP", () async {
                                  setState(() {
                                    _controller = AnimationController(
                                        vsync: this,
                                        duration:
                                            Duration(seconds: levelClock));

                                    _controller.reset();
                                    _controller.forward();
                                  });
                                  await authClass.verifyPhoneNumber(
                                      _phoneNumberController.text,
                                      setData,
                                      context);
                                }, const Color(0xFF93D8FF)),
                              ]),
                        ),
                      ),
                      Positioned(
                          bottom: size.height * 0.03,
                          child: CustomButton(
                            "Submit",
                            () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const LoginScreen()));
                            },
                            BorderRadius.circular(8.0),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _textFieldOTP() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width - 50,
      fieldWidth: 45,
      otpFieldStyle: OtpFieldStyle(
          backgroundColor: const Color(0xFFF5F7FB), borderColor: Colors.white),
      style: const TextStyle(fontSize: 17, color: Colors.black),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      outlineBorderRadius: 5,
      onChanged: (pin) {
        print("complete :" + pin);
      },
      onCompleted: (pin) {
        print("complete :" + pin);
        setState(() {
          smsCode = pin;
        });
      },
    );
  }

  void startTimer() {
    setState(() {
      _controller = AnimationController(
          vsync: this, duration: Duration(seconds: levelClock));

      _controller.reset();
      _controller.forward();
    });
  }

  void setData(verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }
}
