// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class AppColor {
  static Color OnboardingBackgroundColor1 = hexToColor('#FFE5F2');
  static Color OnboardingBackgroundColor2 = hexToColor('#FFF6E5');
  static Color OnboardingBackgroundColor3 = hexToColor('#E7FDF8');
  static Color OnboardingBackgroundColor4 = hexToColor('#E7F8FD');

  static Color OnboardingSmallText = hexToColor('#8B8378');

  static Color ButtonColor = hexToColor('#4681f4');
    static Color SignupBackground = hexToColor('#B8D8D8');
}
