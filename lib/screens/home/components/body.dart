import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rehabbudy/Services/auth_services.dart';
import 'package:rehabbudy/models/user_data.dart';
import 'package:rehabbudy/screens/home/components/search_box.dart';

import 'appoinment_card.dart';
import 'services_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final AuthClass _authClass = AuthClass();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 0,
                  child: Container(
                    height: size.height * 0.4,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Color(0xFF38B6FF),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35)),
                    ),
                  )),
              Positioned(
                top: 35,
                left: 15,
                child: InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      "https://img.freepik.com/free-photo/beautiful-doctor-pointing-fingers_1258-16474.jpg",
                    ),
                    radius: 28,
                  ),
                ),
              ),
              Positioned(
                right: 65,
                top: 40,
                child: InkWell(
                  onTap: () {},
                  child: Stack(children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Image.asset(
                        "assets/icon/notification-bell.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              color: Color(0xFFA61919),
                              borderRadius: BorderRadius.circular(15)),
                        ))
                  ]),
                ),
              ),
              const Positioned(
                  left: 15,
                  top: 90,
                  child: Text(
                    "Hello,",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 28,
                        fontWeight: FontWeight.w400),
                  )),
              Positioned(
                  left: 15,
                  top: 140,
                  child: Text(
                    "Dr. ${loggedInUser.name?.toUpperCase()}",
                    style: const TextStyle(
                        color: Color(0xFFA61919),
                        fontFamily: "Poppins",
                        fontSize: 28,
                        fontWeight: FontWeight.w400),
                  )),
              Positioned(
                right: 0,
                top: 25,
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF38B6FF),
                    radius: 30,
                    child: Image.asset(
                      "assets/icon/menu.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: size.width * 0.03,
                  top: size.height * 0.23,
                  child: SearchBox()),
              Positioned(
                  left: size.width * 0.03,
                  right: size.width * 0.03,
                  top: size.height * 0.33,
                  child: ServicesCard(size)),
              Positioned(bottom: 65, child: AppoinmentCard(size)),
            ],
          )),
    ));
  }

  void _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 1800, maxWidth: 1800);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }

  void _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }
}
