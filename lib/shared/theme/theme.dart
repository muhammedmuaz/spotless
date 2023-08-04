/// [MainTheme] class is used for provideing colors ,
/// All App [Color] and [LinearGradient] are staticly declaration and initialization inside this class

import 'package:flutter/material.dart';

class MainTheme {
  MainTheme();

  factory MainTheme.init() {
    return MainTheme();
  }
  static const Color whiteTypeColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color blueTypeColor = Color.fromRGBO(0, 131, 255, 1);
  static const Color blueTypeOneColor = Color.fromRGBO(1, 164, 255, 1);
  static const Color blueTypeTwoTransparentColor =
      Color.fromRGBO(1, 164, 255, 1);
  static const Color blueTypethreeColor = Color.fromRGBO(171, 225, 255, 1);
  static const Color blueTypeFiveColor = Color.fromRGBO(208, 235, 250, 1);
  static const Color blueTypeOneTransparentColor =
      Color.fromRGBO(171, 225, 225, 190);
  static const Color blueTypeTwoColor = Color.fromRGBO(169, 211, 251, 1);
  static const Color blackTypeColor = Color.fromRGBO(43, 45, 68, 1);
  static const Color blackTypeColor1 = Color.fromRGBO(43, 45, 66, 1);

  static const Color blackypeColor = Color.fromRGBO(28, 35, 64, 1);
  static const Color blackTypeTransparentColor =
      Color.fromRGBO(28, 35, 64, 150);
  static const Color greyTypeColor = Color.fromRGBO(138, 141, 159, 1);
  static const Color greyTypeThreeColor = Color.fromRGBO(131, 141, 159, 1);
  static const Color greyTypeFourColor = Color.fromRGBO(123, 129, 136, 1);
  static const Color greyTypeOneColor = Color.fromRGBO(213, 214, 218, 1);
  static const Color greyTypeOneTransparentColor =
      Color.fromRGBO(213, 214, 218, 100);
  static const Color greyTypeFiveColor = Color.fromRGBO(213, 214, 218, 1);
  static const Color greyTypeSixColor = Color.fromRGBO(227, 227, 227, 1);
  static const Color greyTypeTwoColor = Color.fromRGBO(245, 245, 245, 1);
  static const Color greenTypeColor = Color.fromRGBO(45, 206, 137, 1);
  static const Color redTypeColor = Color.fromRGBO(244, 77, 77, 1);
  static const Color maroonTypeColor = Color.fromRGBO(225, 120, 10, 1);
  static const Color maroonTypeOneColor = Color.fromRGBO(250, 174, 66, 1);
  static const Color greyType1Color = Color.fromRGBO(141, 153, 174, 1);
}
