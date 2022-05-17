import 'package:flutter/material.dart';

import 'service_items.dart';

class ServicesCard extends StatelessWidget {
  final Size size;
  const ServicesCard(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.32,
      width: size.width * 0.93,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              height: 120,
              width: size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ServiceItem("Occupational\nTherapy",
                      "assets/images/talk-doctor 1.png", size, () {}),
                  ServiceItem("Special\nEducation",
                      "assets/images/lab test 1.png", size, () {}),
                  ServiceItem("Clinical\nPsychology",
                      "assets/images/medicine 1.png", size, () {}),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ServiceItem("Speech Therapy", "assets/images/talk-doctor 1.png",
                    size, () {}),
                ServiceItem("Physiotherapy", "assets/images/lab test 1.png",
                    size, () {}),
                ServiceItem("Buy Medicine", "assets/images/medicine 1.png",
                    size, () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
