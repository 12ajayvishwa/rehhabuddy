import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rehabbudy/screens/login/login_screen.dart';
import '../models/user_data.dart';
import '../screens/home/home.dart';
import '../screens/otp_verification/otp_verification.dart';

class AuthClass {
  final _auth = FirebaseAuth.instance;

  void signUp(String email, String password, String name, String phoneNumber,
      BuildContext context) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore(name, phoneNumber, context)})
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  postDetailsToFirestore(
      String name, String phoneNumber, BuildContext context) async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = name;
    userModel.phonenumber = phoneNumber;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => OtpVerification(phoneNumber)),
        (route) => false);
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
              Fluttertoast.showToast(msg: "Login Successfull"),
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const Home())),
            })
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  Future<void> forgotPassword(String email, BuildContext context) async {
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => {
              Fluttertoast.showToast(
                  msg: "Email sended successfully\ncheck your email."),
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()))
            })
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  Future<void> verifyPhoneNumber(
      String phoneNumber, Function setData, BuildContext context) async {
    // ignore: prefer_function_declarations_over_variables
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      Fluttertoast.showToast(msg: "Verification Completed :) ");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginScreen()));
    };

    // ignore: avoid_types_as_parameter_names, prefer_function_declarations_over_variables
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      Fluttertoast.showToast(msg: exception.toString());
    };
    // ignore: prefer_function_declarations_over_variables
    PhoneCodeSent codeSent = (String? verificationID, [int? resendCode]) {
      Fluttertoast.showToast(
          msg: "Verification code sended on the phone number");
      setData(verificationID);
    };
    // ignore: prefer_function_declarations_over_variables
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String? verificationID) {
      Fluttertoast.showToast(msg: "Time Out");
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> signInWithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => const Home()), (route) => false);
      Fluttertoast.showToast(msg: "Logged In");
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()));
  }
}
