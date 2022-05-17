import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rehabbudy/screens/disease_screen/disease_screen.dart';
import 'package:rehabbudy/screens/login/login_screen.dart';
import 'package:rehabbudy/screens/patient_details_screen/patient_details_screen.dart';
import 'package:rehabbudy/screens/splash_screen/splash_screen.dart';

import 'screens/doctors_screen/doctors_screen.dart';
import 'screens/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    Widget firstWidget;

    if (firebaseUser != null) {
      firstWidget = const Home();
    } else {
      firstWidget = const SplashScreen();
    }
    return MaterialApp(
        title: 'RehhabBudy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color(0xFF93D8FF),
            textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 18,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              headline2: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w600),
              headline3: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w400),
              headline4: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.bold),
            )),
        home: DoctorsScreen());
  }
}
