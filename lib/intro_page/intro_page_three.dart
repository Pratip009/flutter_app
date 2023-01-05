import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            "https://assets7.lottiefiles.com/packages/lf20_t8pf3UfDYk.json"),
      ),
    );
  }
}
