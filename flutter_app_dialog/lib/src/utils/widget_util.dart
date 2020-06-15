import 'package:flutter/material.dart';

class WidgetUtil {
  ///Tan.nguyen 6/15/20 : https://ios-resolution.com/
  static double resizeByWidth(context, double value, {double logicalWidth}) {
    double screenWidth = MediaQuery.of(context).size.width;

    ///Tan.nguyen 6/15/20 : logicalWidth default is 375 (IphoneX)
    double result = value * screenWidth / logicalWidth ?? 375;
    return result ?? value;
  }
}
