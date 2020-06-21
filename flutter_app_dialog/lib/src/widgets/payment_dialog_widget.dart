import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../flutter_app_dialog.dart';

class PaymentDialog extends StatefulWidget {
  final double dialogHeight;
  final double dialogWidth;
  final Image icon;
  final Color iconColor;
  final double iconSize;
  final String paymentStatus;
  final TextStyle paymentStatusStyle;
  final String message;
  final TextStyle messageStyle;
  final String buttonName;
  final Color buttonColor;
  final TextStyle buttonStyle;
  final Function onPressButton;

  const PaymentDialog(
      {Key key,
      this.dialogHeight,
      this.dialogWidth,
      this.icon,
      this.iconColor,
      this.iconSize,
      this.paymentStatus,
      this.paymentStatusStyle,
      this.message,
      this.messageStyle,
      this.buttonName,
      this.buttonStyle,
      this.onPressButton,
      this.buttonColor})
      : super(key: key);

  @override
  _PaymentDialogState createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.dialogHeight ?? WidgetUtil.resizeByWidth(context, 300),
        width: widget.dialogWidth ?? MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 35,
              ),
              buildIconDialog(),
              SizedBox(
                height: 10,
              ),
              buildPaymentStatusDialog(),
              SizedBox(
                height: 9,
              ),
              buildMessageDialog(),
              SizedBox(
                height: 40,
              ),
              buildButtonDialog(),
            ],
          ),
        ));
  }

  ///Tan.nguyen 6/21/20 :build Icon
  Widget buildIconDialog() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: WidgetUtil.resizeByWidth(context, 42),
        child: Center(
          child: widget.icon ??
              Icon(
                Icons.check_circle_outline,
                color: widget.iconColor ?? Color.fromRGBO(126, 211, 33, 1),
                size: widget.iconSize ?? 50,
              ),
        ));
  }

  ///Tan.nguyen 6/21/20 : build payment status
  Widget buildPaymentStatusDialog() {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      height: WidgetUtil.resizeByWidth(context, 21),
      child: Text(
        widget.paymentStatus ?? 'SUCCESSFUL',
        style: widget.paymentStatusStyle ??
            TextStyle(
              fontSize: WidgetUtil.resizeByWidth(context, 14),
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(4, 4, 15, 0.4),
            ),
      ),
    );
  }

  ///Tan.nguyen 6/21/20 : build message
  Widget buildMessageDialog() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: WidgetUtil.resizeByWidth(context, 57),
      padding: EdgeInsets.only(left: 37, right: 37),
      child: Text(
        widget.message ?? 'Thank you for the payment',
        textAlign: TextAlign.center,
        style: widget.messageStyle ??
            TextStyle(
                color: Color.fromRGBO(69, 90, 100, 1),
                fontSize: WidgetUtil.resizeByWidth(context, 24),
                fontWeight: FontWeight.bold),
      ),
    );
  }

  ///Tan.nguyen 6/20/20 : build button
  Widget buildButtonDialog() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: WidgetUtil.resizeByWidth(context, 44),
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: widget.buttonColor ?? Color.fromRGBO(59, 183, 207, 1)),
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
