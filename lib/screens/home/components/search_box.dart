import 'package:flutter/material.dart';
import 'package:rehabbudy/utils/constant/input_fields_decoration.dart';

class SearchBox extends StatefulWidget {
  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  List doctorList = [
    'Dr. Adhya Yadav',
    'Dr. Nakul Kaushik',
    'Dr. Bhavna Mena',
    'Dr. Chhaya Yadav'
  ];

  List filteredList = [];

  @override
  void initState() {
    filteredList = doctorList;
    super.initState();
  }

  void filter(String inputString) {
    doctorList.where((i) => i.toUpperCase().contains(inputString)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.075,
        width: size.width * 0.95,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            elevation: 8,
            child: TextField(
                cursorHeight: 25,
                keyboardType: TextInputType.text,
                decoration: searchInputDecoration("search..."))));
  }
}
