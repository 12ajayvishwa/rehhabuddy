import 'package:flutter/material.dart';
import 'package:rehabbudy/Services/auth_services.dart';
import 'package:rehabbudy/screens/signup/signup_screen.dart';
import 'package:rehabbudy/utils/constant/rehab_logo.dart';
import '../../../utils/constant/background.dart';
import '../../../utils/constant/custom_button.dart';
import '../../../utils/constant/form_input_field.dart';
import '../../../utils/constant/text_button.dart';
import '../../forgot_password_screen/forgot_password_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthClass _authClass = AuthClass();

  bool isVisible = true;
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                  padding: EdgeInsets.only(top: 25), child: RehabLogo()),
              const SizedBox(
                height: 25,
              ),
              _loginFormWidget(size, context),
            ],
          ),
        ),
      ),
    );
  }

  _loginFormWidget(Size size, BuildContext context) {
    return Form(
      key: _formkey,
      child: SizedBox(
        height: size.height * 0.58,
        width: size.width * 0.9,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: size.height * 0.01,
                left: size.width * 0.04,
                child: Image.asset(
                  "assets/images/heart.jpg",
                  height: 140,
                  width: 140,
                ),
              ),
              Positioned(
                top: size.height * 0.15,
                left: size.width * 0.1,
                child: const Text(
                  "PATIENT",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF38B6FF)),
                ),
              ),
              Positioned(
                left: 10,
                right: 10,
                bottom: 140,
                child: _loginFieldsWidget(size),
              ),
              Positioned(
                bottom: 110,
                right: 0,
                child: TexttButton("Forgot Password?", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ForgotPasswordScreen()));
                }, const Color(0xFF1EA6D6)),
              ),
              Positioned(
                bottom: 50,
                child: CustomButton(
                  "Login",
                  () async {
                    await _authClass.signIn(
                        emailController.text, passwordController.text, context);
                  },
                  BorderRadius.circular(8.0),
                ),
              ),
              Positioned(
                bottom: 0,
                child: TexttButton("SignUp", () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const SignUpScreen()));
                }, const Color(0xFF38B6FF)),
              )
            ],
          ),
        ),
      ),
    );
  }

  _loginFieldsWidget(Size size) {
    return SizedBox(
      height: size.height * 0.21,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          FormInputFields(
              size: size,
              controller: emailController,
              validator: emailValidator,
              textInputType: TextInputType.emailAddress,
              hintText: "Enter email or username"),
          const SizedBox(
            height: 10.0,
          ),
          PasswordInputFields(
              size: size,
              controller: passwordController,
              validator: passwordValidator,
              iconButton: IconButton(
                icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
                color: isVisible ? const Color(0xFFC3C2C2) : Colors.blue,
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              ),
              obsecureText: isVisible,
              hintText: "Enter Password"),
        ],
      ),
    );
  }

  String? emailValidator(value) {
    if (value!.isEmpty) {
      return ("Please Enter Your Email");
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return ("Please Enter a valid email");
    }
    return null;
  }

  String? passwordValidator(value) {
    RegExp regex = RegExp(r'^.{6,}$');
    if (value!.isEmpty) {
      return ("Password is required for login");
    }
    if (!regex.hasMatch(value)) {
      return ("Enter Valid Password(Min. 6 Character)");
    }
    return null;
  }
}
