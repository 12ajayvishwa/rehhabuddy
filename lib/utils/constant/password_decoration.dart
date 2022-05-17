import 'package:flutter/material.dart';

InputDecoration passwordInputDecoration(
  String hintText,
  IconButton iconButton,
) {
  return InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      hintText: hintText,
      suffixIcon: iconButton,
      hintStyle: const TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Color(0xFFA8A7A7)),
      filled: true,
      fillColor: const Color(0xFFF5F7FB),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none));
}
