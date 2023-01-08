// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_application_gospeedy/intro_page/intro_page_four.dart';
import 'package:flutter_application_gospeedy/intro_page/intro_page_one.dart';
import 'package:flutter_application_gospeedy/intro_page/intro_page_three.dart';
import 'package:flutter_application_gospeedy/intro_page/intro_page_two.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  //last page track
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              IntroPageOne(),
              IntroPageTwo(),
              IntroPageThree(),
              IntroPageFour(),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //skip text
                  GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(3);
                      },
                      child: Text("Skip")),
                  //dot indicator
                  SmoothPageIndicator(controller: _controller, count: 4),
                  //next button or done(for last page)
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                "Done",
                                style: GoogleFonts.roboto(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn);
                          },
                          child: Text("Next"),
                        ),
                ],
              )),
        ],
      ),
    );
  }
}
