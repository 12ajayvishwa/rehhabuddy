import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rehabbudy/models/appoinment_data.dart';
import 'package:rehabbudy/screens/patient_details_screen/patient_details_screen.dart';

class AppoinmentCard extends StatelessWidget {
  final Size size;

  const AppoinmentCard(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.25,
      width: size.width * 0.93,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pre - First Appoinment Or Subscription",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF000000)),
              ),
              Row(
                children: [
                  CardAppoin(
                      Color.fromARGB(255, 183, 190, 249),
                      "assets/images/stethoscope.png",
                      "UPLOAD\nYOUR\nASSESSMENT", () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PatientDetailsScreen()));
                  }, size),
                  CardAppoin(Color(0xFFFF7854), "assets/images/teath.png",
                      "TAKE A\nSELF\nASSESSMENT", () {}, size),
                  CardAppoin(Color(0xFF68EEBE), "assets/images/medicine.png",
                      "APPOINTMENT\nFOR ONLINE\nASSESSMENT", () {}, size)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardAppoin extends StatelessWidget {
  Color color;
  String imgUrl;
  String text;
  GestureTapCallback onPressed;
  Size size;

  CardAppoin(this.color, this.imgUrl, this.text, this.onPressed, this.size);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          height: size.height * 0.19,
          width: size.width * 0.295,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          child: Card(
            elevation: 8,
            color: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                top: 10,
                child: Container(
                  height: 32,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13)),
                  child: Center(
                      child: Image.asset(
                    imgUrl,
                    height: 25,
                    width: 25,
                  )),
                ),
              ),
              Positioned(
                left: 8,
                bottom: 10,
                child: Text(
                  text,
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              )
            ]),
          ),
        ));
  }
}
