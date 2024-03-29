import 'package:flutter/material.dart';

/// Tan.nguyen 4/21/21 :
/// Define Divider Line
///
/// [width] width of divider line,
/// [height] default is 0.5
///
class DividerLine extends StatelessWidget {
  final double? width;

  /// With of divider line
  ///
  /// Default value is MediaQuery.of(context).size.width (full size of screen width)
  final double? height;

  /// Height of divider line
  ///
  /// Default value is 0.5

  const DividerLine({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 0.5,
      color: Color.fromRGBO(226, 226, 226, 1),
    );
  }
}
