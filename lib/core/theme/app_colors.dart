// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppColors {
  static Color splashScreenBackground =const Color.fromRGBO (242, 241, 236, 1);

  static Color primaryColor =  Color(0xFF9EBC8C);
    static Color secondaryColor = const Color.fromRGBO (217, 217, 217, 1);


  static Color primaryTextColor = const Color.fromRGBO(53, 67, 73, 1); 
  static Color secondaryTextColor = const Color.fromRGBO  (9, 9, 9, 1);
  static Color thirdTextColor = const Color.fromRGBO(9, 9, 9, 0.6);
  static Color fourthTextColor =  Colors.white;
  static Color sexthTextColor = Color(0xFF9EBC8C);

}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
