import 'package:flutter/material.dart';
import 'package:rehabbudy/Services/auth_services.dart';
import 'package:rehabbudy/utils/constant/background.dart';
import 'package:rehabbudy/utils/constant/custom_button.dart';
import 'package:rehabbudy/utils/constant/form_input_field.dart';
import '../../../utils/constant/rehab_logo.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  final AuthClass _authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: backgroundImage(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 25,
                    left: 0,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ))),
                const Positioned(
                  top: 35,
                  child: RehabLogo(),
                ),
                Positioned(bottom: 160, child: forgotPForm(size, context))
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox forgotPForm(Size size, BuildContext context) {
    const sizedBox = SizedBox(
      height: 25,
    );
    return SizedBox(
      height: size.height * 0.5,
      width: size.width * 0.9,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        color: Colors.white,
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Receive an email\nto reset your password.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              sizedBox,
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: FormInputFields(
                    size: size,
                    controller: emailController,
                    validator: emailValidator,
                    textInputType: TextInputType.emailAddress,
                    hintText: "Enter Your Email Id"),
              ),
              sizedBox,
              CustomButton(
                "Reset Password",
                () async {
                  if (_formkey.currentState!.validate()) {
                    _authClass.forgotPassword(emailController.text, context);
                  }
                },
                BorderRadius.circular(8.0),
              )
            ],
          ),
        ),
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
}
