import 'package:flutter/material.dart';
import 'package:flutter_app_dialog/flutter_app_dialog.dart';

class BasicDialog extends StatefulWidget {
  const BasicDialog(
      {Key key,
      this.dialogHeight,
      this.dialogWidth,
      this.tittle,
      this.tittleStyle,
      this.content,
      this.contentStyle,
      this.iconColor})
      : super(key: key);

  @override
  _BasicDialogState createState() => _BasicDialogState();
  final double dialogHeight;
  final double dialogWidth;
  final Color iconColor;
  final String tittle;
  final TextStyle tittleStyle;
  final String content;
  final String contentStyle;
}

class _BasicDialogState extends State<BasicDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.dialogHeight ?? WidgetUtil.resizeByWidth(context, 300),
        width: widget.dialogWidth ?? MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              buildButtonClose(),
              SizedBox(
                height: 20,
              ),
              buildTittleDialog(),
              SizedBox(
                height: 35,
              ),
              buildContentDialog(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }

  ///Tan.nguyen 6/21/20 : build button close
  Widget buildButtonClose() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: WidgetUtil.resizeByWidth(context, 25),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.close,
          color: widget.iconColor ?? Color.fromRGBO(141, 220, 191, 1),
          size: 25,
        ),
      ),
    );
  }

  ///Tan.nguyen 6/21/20 : build title
  Widget buildTittleDialog() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: WidgetUtil.resizeByWidth(context, 34),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Text(
          widget.tittle ?? 'Example tittle',
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: widget.tittleStyle ??
              TextStyle(
                  fontSize: WidgetUtil.resizeByWidth(context, 30),
                  color: Color.fromRGBO(42, 42, 48, 1),
                  fontWeight: FontWeight.bold),
        ));
  }

  ///Tan.nguyen 6/21/20 : build content dialog
  Widget buildContentDialog() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: WidgetUtil.resizeByWidth(context, 100),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Text(
          widget.content ??
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          textAlign: TextAlign.center,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: widget.contentStyle ??
              TextStyle(
                fontSize: WidgetUtil.resizeByWidth(context, 14),
                color: Color.fromRGBO(130, 131, 147, 1),
                fontWeight: FontWeight.w500,
              ),
        ));
  }
}
