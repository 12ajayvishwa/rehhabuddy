import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController _controller;

  CustomTabBar(this._controller);
  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: _controller,
        isScrollable: true,
        labelPadding: EdgeInsets.only(left: 8, right: 8),
        labelColor: Colors.white,
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Color(0xFF38B6FF)),
        unselectedLabelColor: Color.fromRGBO(0, 109, 119, 0.56),
        unselectedLabelStyle: const TextStyle(
            fontSize: 13, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
        tabs: [
          Tab(
            child: Tabs("My Self"),
          ),
          Tab(
            child: Tabs("Wife"),
          ),
          Tab(
            child: Tabs("Father"),
          ),
          Tab(
            child: Tabs("Mother"),
          ),
          Tab(
            child: Tabs("Sister"),
          ),
          Tab(
            child: Tabs("Friend"),
          )
        ]);
  }

  Container Tabs(String text) {
    return Container(
      height: 54,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Color(0xFF38B6FF))),
      child: Align(
        alignment: Alignment.center,
        child: Text(text),
      ),
    );
  }
}
