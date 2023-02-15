import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Tan.nguyen 4/21/21 :
/// Define [PaymentDialog]
///
/// Usage:
/// ```dart
/// PaymentDialog(
///   paymentStatus: 'Successful',
///   message: 'Thank you for the payment',
/// )
/// ```
/// See also:
/// [dialogHeight] height of dialog default is 300
/// [dialogWidth] width of dialog
/// [icon] icon of payment status
/// [paymentStatus] as String: ex: Successful, or fail from partner, etc
/// [message] display message of dialog
/// [paymentStatusStyle], [messageStyle] TextStyle
/// [buttonName] you can custom button name: ex: OK, cancel
/// with custom size, style, etc.. via [buttonStyle], [buttonColor],
/// [onPressButton] handle func onPress
///
///
class PaymentDialog extends StatefulWidget {
  final double? dialogHeight;

  /// Dialog height
  ///
  /// Default value is 300
  final double? dialogWidth;

  /// Dialog width
  ///
  /// Default value is MediaQuery.of(context).size.width(Full size of screen)
  final Icon? icon;

  /// Icon of payment status
  final Color? iconColor;

  /// Icon color of payment status
  ///
  /// Default is Color.fromRGBO(126, 211, 33, 1)
  final double? iconSize;

  ///  Set iconSize default value is 50
  final String? paymentStatus;

  /// [paymentStatus] as String: ex: Successful, or fail from partner, etc
  final TextStyle? paymentStatusStyle;

  /// Payment status style
  final String? message;

  /// Display message of dialog
  final TextStyle? messageStyle;

  /// Message text style
  final String? buttonName;

  /// Button name as String: ex: ok, confirm
  final Color? buttonColor;

  /// Button color default value is Color.fromRGBO(59, 183, 207, 1)
  final TextStyle? buttonStyle;

  /// Button style as TextStyle
  final Function? onPressButton;

  /// Function on press button

  const PaymentDialog(
      {Key? key,
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
        height: widget.dialogHeight ?? ScreenUtil().setHeight(300),
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
        height: ScreenUtil().setHeight(42),
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
      height: ScreenUtil().setHeight(21),
      child: Text(
        widget.paymentStatus ?? 'SUCCESSFUL',
        style: widget.paymentStatusStyle ??
            TextStyle(
              fontSize: ScreenUtil().setHeight(14),
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
      height: ScreenUtil().setHeight(57),
      padding: EdgeInsets.only(left: 37, right: 37),
      child: Text(
        widget.message ?? 'Thank you for the payment',
        textAlign: TextAlign.center,
        style: widget.messageStyle ??
            TextStyle(
                color: Color.fromRGBO(69, 90, 100, 1),
                fontSize: ScreenUtil().setSp(24),
                fontWeight: FontWeight.bold),
      ),
    );
  }

  ///Tan.nguyen 6/20/20 : build button
  Widget buildButtonDialog() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil().setHeight(44),
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
          style: widget.buttonStyle ??
              TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
