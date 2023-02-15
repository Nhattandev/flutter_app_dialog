import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// Define [NoInternetConnectionDialog]
///
/// Usage:
/// ```dart
/// NoInternetConnectionDialog(
///   tittle: 'tittle',
///   content: 'Your message',
/// )
/// ```
/// See also:
/// [dialogHeight] height of dialog default is 300
/// [dialogWidth] width of dialog
/// [tittle], [content] display title and content of dialog without default message
/// [tittleStyle], [contentStyle] TextStyle
///
///
class NoInternetConnectionDialog extends StatefulWidget {
  const NoInternetConnectionDialog(
      {Key? key,
      this.dialogWidth,
      this.dialogHeight,
      this.topDialogWidth,
      this.topDialogHeight,
      this.topDialogColor,
      this.title,
      this.titleStyle,
      this.centerDialogWidth,
      this.centerDialogHeight,
      this.content,
      this.contentStyle})
      : super(key: key);

  @override
  _NoInternetConnectionDialogState createState() =>
      _NoInternetConnectionDialogState();
  final double? dialogWidth;

  /// Dialog width
  ///
  /// Default value is MediaQuery.of(context).size.width(Full size of screen)
  final double? dialogHeight;

  /// Dialog height, default value is 300
  final double? topDialogWidth;

  /// Top dialog width
  final double? topDialogHeight;

  /// Top dialog height
  final Color? topDialogColor;

  /// Top dialog color
  final String? title;

  /// Title as String
  final TextStyle? titleStyle;

  /// Title Style
  final double? centerDialogWidth;

  /// Center dialog width
  final double? centerDialogHeight;

  /// Center dialog height
  final String? content;

  /// Content as String
  final TextStyle? contentStyle;

  /// Content style
}

class _NoInternetConnectionDialogState
    extends State<NoInternetConnectionDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.dialogHeight ?? ScreenUtil().setHeight(300),
        width: widget.dialogWidth ?? MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildTopDialog(),
              buildCenterDialog(),
            ],
          ),
        ));
  }

  ///Tan.nguyen 6/20/20 : build top dialog
  Widget buildTopDialog() {
    return Container(
      width: widget.topDialogWidth ?? MediaQuery.of(context).size.width,
      height: widget.topDialogHeight ??
          widget.dialogHeight ??
          ScreenUtil().setHeight(80),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        color: widget.topDialogColor ?? Color.fromRGBO(118, 80, 193, 1),
      ),
      child: Center(
        child: Text(
          widget.title ?? 'No Internet',
          style: widget.titleStyle ??
              TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  ///Tan.nguyen 6/20/20 : build center dialog
  Widget buildCenterDialog() {
    return Container(
      width: widget.centerDialogWidth ?? MediaQuery.of(context).size.width,
      height: widget.centerDialogHeight ??
          widget.dialogHeight ??
          ScreenUtil().setHeight(220),
      padding: EdgeInsets.only(left: 10, right: 10),
      color: Colors.white,
      child: Center(
        child: Text(
          widget.content ?? "Please check your connection status and try again",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: widget.contentStyle ??
              TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
        ),
      ),
    );
  }
}
