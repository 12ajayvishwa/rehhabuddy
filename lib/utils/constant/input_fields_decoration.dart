import 'package:flutter/material.dart';

InputDecoration inputDecoration(
  String hintText,
) {
  return InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 12.0),
      hintText: hintText,
      hintStyle: const TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Color(0xFFA8A7A7)),
      filled: true,
      fillColor: const Color(0xFFF5F7FB),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none));
}

InputDecoration searchInputDecoration(
  String hintText,
) {
  return InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      hintText: hintText,
      prefixIcon: Icon(
        Icons.search,
        color: Colors.blue,
        size: 30,
      ),
      hintStyle: const TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Color(0xFFA8A7A7)),
      filled: true,
      fillColor: const Color(0xFFF5F7FB),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: BorderSide.none),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: BorderSide.none),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: BorderSide.none));
}

InputDecoration formInputDecoration(
  String hintText,
) {
  return InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 10.0),
      hintText: hintText,
      hintStyle: const TextStyle(
          fontFamily: "Poppins",
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Color(0xFFA8A7A7)),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Color(0xFFCAD2D9),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Color(0xFFCAD2D9),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Color(0xFFCAD2D9),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Color(0xFFCAD2D9),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Color(0xFFCAD2D9),
        ),
      ));
}

InputDecoration genderFieldInputDecoration(
    String hintText, IconButton iconButton) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 10.0),
    hintText: hintText,
    suffixIcon: iconButton,
    hintStyle: const TextStyle(
        fontFamily: "Poppins",
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Color(0xFFA8A7A7)),
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Color(0xFFCAD2D9),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Color(0xFFCAD2D9),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Color(0xFFCAD2D9),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Color(0xFFCAD2D9),
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Color(0xFFCAD2D9),
      ),
    ),
  );
}
