// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_gospeedy/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPageFour extends StatelessWidget {
  const IntroPageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.OnboardingBackgroundColor4,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                "https://assets1.lottiefiles.com/packages/lf20_q2Q6BVY6eB.json",
                width: 200,
                height: 200),
            SizedBox(
              height: 10,
            ),
            Text(
              "Voucher",
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
            Text(
              "Daily promotion upto 50% shopping\n without worry about price",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 15,
                height: 1.5,
                color: AppColor.OnboardingSmallText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
