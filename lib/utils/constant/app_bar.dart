import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final VoidCallback onTab;

  CustomAppBar(this.title, this.onPressed, this.onTab);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF38B6FF),
      title: Text(title),
      centerTitle: false,
      titleTextStyle: const TextStyle(
          fontSize: 16,
          fontFamily: "Poppins",
          color: Colors.white,
          fontWeight: FontWeight.w500),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: onPressed,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: InkWell(
            onTap: onTab,
            child: Image.asset(
              "assets/icon/house.png",
              color: Colors.white,
              height: 35,
              width: 35,
            ),
          ),
        )
      ],
    );
  }
}
