// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_gospeedy/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.OnboardingBackgroundColor2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                "https://assets7.lottiefiles.com/packages/lf20_t8pf3UfDYk.json",
                width: 200,
                height: 200),
            SizedBox(
              height: 10,
            ),
            Text(
              "Shopping",
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Text(
                "earn upto 7% when you trade via\n ftripay e-wallet",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 15,
                  height: 1.5,
                  color: AppColor.OnboardingSmallText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
