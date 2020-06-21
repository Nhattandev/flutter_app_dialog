import 'dart:ui';

import 'package:flutter/material.dart';

import '../../flutter_app_dialog.dart';

class InfoDialog extends StatefulWidget {
  const InfoDialog({
    Key key,
    this.dialogWidth,
    this.dialogHeight,
    this.topDialogWidth,
    this.topDialogHeight,
    this.topDialogColor,
    this.centerDialogWidth,
    this.centerDialogHeight,
    this.content,
    this.contentStyle,
    this.tittle,
    this.tittleStyle,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonColor,
    this.buttonName,
    this.buttonStyle,
    this.onPressButton,
  }) : super(key: key);

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

  final double buttonWidth;
  final double buttonHeight;
  final Color buttonColor;
  final String buttonName;
  final TextStyle buttonStyle;
  final Function onPressButton;

  _InfoDialogState createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.dialogHeight ?? WidgetUtil.resizeByWidth(context, 300),
        width: widget.dialogWidth ?? MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildTopDialog(),
              buildCenterDialog(),
              buildBottomDialog(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }

  ///Tan.nguyen 6/20/20 : build top dialog
  Widget buildTopDialog() {
    return Container(
      width: widget.topDialogWidth ?? MediaQuery.of(context).size.width,
      height: widget.topDialogHeight ?? widget.dialogHeight ?? WidgetUtil.resizeByWidth(context, 80),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        color: widget.topDialogColor ?? Color.fromRGBO(118, 80, 193, 1),
      ),
      child: Center(
        child: Text(
          widget.tittle ?? 'TITTLE',
          style: widget.tittleStyle ?? TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  ///Tan.nguyen 6/20/20 : build center dialog
  Widget buildCenterDialog() {
    return Container(
      width: widget.centerDialogWidth ?? MediaQuery.of(context).size.width,
      height: widget.centerDialogHeight ?? widget.dialogHeight ?? WidgetUtil.resizeByWidth(context, 130),
      padding: EdgeInsets.only(left: 10, right: 10),
      color: Colors.white,
      child: Center(
        child: Text(
          widget.content ??
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
          style: widget.contentStyle ?? TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  ///Tan.nguyen 6/20/20 : build bottom dialog
  Widget buildBottomDialog() {
    return Container(
      width: widget.buttonWidth ?? MediaQuery.of(context).size.width,
      height: widget.buttonHeight ?? widget.dialogHeight ?? WidgetUtil.resizeByWidth(context, 50),
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: widget.buttonColor ?? Color.fromRGBO(12, 209, 211, 1)),
      child: RawMaterialButton(
        onPressed: () {
          widget.onPressButton ?? Navigator.pop(context);
        },
        child: Text(
          widget.buttonName ?? "OK",
          style: widget.buttonStyle ?? TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
