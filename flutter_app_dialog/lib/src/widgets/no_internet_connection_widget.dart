import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetConnectionDialog extends StatefulWidget {
  const NoInternetConnectionDialog(
      {Key key,
      this.dialogWidth,
      this.dialogHeight,
      this.topDialogWidth,
      this.topDialogHeight,
      this.topDialogColor,
      this.tittle,
      this.tittleStyle,
      this.centerDialogWidth,
      this.centerDialogHeight,
      this.content,
      this.contentStyle})
      : super(key: key);

  @override
  _NoInternetConnectionDialogState createState() => _NoInternetConnectionDialogState();
  final double dialogWidth;
  final double dialogHeight;

  final double topDialogWidth;
  final double topDialogHeight;
  final Color topDialogColor;
  final String tittle;
  final TextStyle tittleStyle;

  final double centerDialogWidth;
  final double centerDialogHeight;
  final String content;
  final TextStyle contentStyle;
}

class _NoInternetConnectionDialogState extends State<NoInternetConnectionDialog> {
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
      height: widget.topDialogHeight ?? widget.dialogHeight ?? ScreenUtil().setHeight(80),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        color: widget.topDialogColor ?? Color.fromRGBO(118, 80, 193, 1),
      ),
      child: Center(
        child: Text(
          widget.tittle ?? 'No Internet',
          style: widget.tittleStyle ?? TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  ///Tan.nguyen 6/20/20 : build center dialog
  Widget buildCenterDialog() {
    return Container(
      width: widget.centerDialogWidth ?? MediaQuery.of(context).size.width,
      height: widget.centerDialogHeight ?? widget.dialogHeight ?? ScreenUtil().setHeight(220),
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
