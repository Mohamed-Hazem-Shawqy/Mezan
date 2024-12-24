import 'package:flutter/material.dart';

class ResponsiveScreen {
  static late double screenWidth;
  static late double screenHeight;

  static void initializeScreen(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}
