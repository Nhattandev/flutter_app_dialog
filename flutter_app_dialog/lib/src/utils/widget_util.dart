import 'package:flutter/material.dart';

///Tan.nguyen 6/15/20 : https://ios-resolution.com/
class WidgetUtil {
  static double resizeByWidth(context, double value) {
    double screenWidth = MediaQuery.of(context).size.width;
    double result = value * screenWidth / 375;
    return result ?? value;
  }
}
