import 'package:flutter/material.dart';
import 'package:rehabbudy/screens/login/login_screen.dart';
import 'package:rehabbudy/screens/signup/signup_screen.dart';
import '../../../utils/constant/text_button.dart';
import 'box_field.dart';

class BottomBox extends StatelessWidget {
  const BottomBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: size.width,
        height: size.height * 0.3,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const SignUpScreen()));
          },
          child: SizedBox(
            height: size.height * 0.201,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.9,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromRGBO(147, 216, 255, 0.3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "+91",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Enter mobile Number",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFF808080)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const BoxField("Your Name", Icons.person),
                const SizedBox(
                  height: 8.0,
                ),
                const BoxField("Your Personal email", Icons.email),
              ],
            ),
          ),
        ),
      ),
      Positioned(
          bottom: 0,
          child: Row(
            children: [
              const Text("Already have an account?"),
              TexttButton("Login", () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              }, Colors.blue)
            ],
          ))
    ]);
  }
}
