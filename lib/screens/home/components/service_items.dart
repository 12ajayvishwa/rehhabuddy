import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceItem extends StatelessWidget {
  final String imgUrl;
  final String catrgory;
  final Size size;
  final GestureTapCallback onPressed;

  ServiceItem(this.catrgory, this.imgUrl, this.size, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 120,
        width: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(imgUrl),
            Text(
              catrgory,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 12,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF000000)),
            )
          ],
        ),
      ),
    );
  }
}
