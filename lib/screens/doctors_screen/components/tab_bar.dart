import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  const CustomTabBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Card(
        elevation: 2,
        child: Container(
          height: size.height * 0.045,
          width: size.width * 0.75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
          child: TabBar(
            controller: tabController,
            labelPadding: EdgeInsets.zero,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFF38B6FF)),
            unselectedLabelColor: Color.fromRGBO(30, 166, 214, 0.7),
            unselectedLabelStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins"),
            tabs: [Tabs("Active Doctors"), Tabs("Former Doctor")],
          ),
        ),
      ),
    );
  }

  Container Tabs(String text) {
    return Container(
      height: 60,
      width: 155,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
        ),
      ),
    );
  }
}
