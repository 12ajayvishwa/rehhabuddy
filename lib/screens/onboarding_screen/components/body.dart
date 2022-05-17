import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rehabbudy/models/onboarding_data.dart';
import 'package:rehabbudy/utils/constant/background.dart';
import 'bottom_box.dart';
import 'last_page_widget.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentIndex < 3) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _controller.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: backgroundImage(),
          child: Column(
            children: [
              pageViewBuilder(size),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      details.length, (index) => buildDot(index, context)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BottomBox(size: size)
            ],
          ),
        ),
      ),
    );
  }

  Expanded pageViewBuilder(Size size) {
    return Expanded(
      child: PageView.builder(
        controller: _controller,
        reverse: false,
        pageSnapping: false,
        itemCount: details.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  details[index].title,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              index == 3
                  ? const LastPageWidget()
                  : Text(
                      details[index].desc,
                      softWrap: true,
                      style: Theme.of(context).textTheme.headline2,
                    ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: size.height * 0.065,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(details[index].headline,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 40, right: 40),
                child: SvgPicture.asset(
                  details[index].imgUrl,
                  height: 300,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index
              ? const Color(0xFFFFFFFF)
              : const Color(0xFFDBDBDB)),
    );
  }
}
