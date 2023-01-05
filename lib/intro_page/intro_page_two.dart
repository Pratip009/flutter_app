import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            "https://assets8.lottiefiles.com/packages/lf20_XWnyRzwZRB.json"),
      ),
    );
  }
}
