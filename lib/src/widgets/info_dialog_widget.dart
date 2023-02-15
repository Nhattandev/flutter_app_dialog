import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// Define [InfoDialog]
///
/// Usage:
/// ```dart
/// InfoDialog(
///   tittle: 'tittle',
///   content: 'Your message',
/// )
/// ```
/// See also:
/// [dialogHeight] height of dialog default is 300
/// [dialogWidth] width of dialog
/// [tittle], [content] display title and content of dialog
/// [tittleStyle], [contentStyle] TextStyle
/// [buttonName] you can custom button name: ex: OK, cancel
/// with custom size, style, etc.. via [buttonWidth], [buttonHeight], [buttonStyle]
/// [onPressButton] handle func onPress
///
///
class InfoDialog extends StatefulWidget {
  const InfoDialog({
    Key? key,
    this.dialogWidth,
    this.dialogHeight,
    this.topDialogWidth,
    this.topDialogHeight,
    this.topDialogColor,
    this.centerDialogWidth,
    this.centerDialogHeight,
    this.content,
    this.contentStyle,
    this.title,
    this.titleStyle,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonColor,
    this.buttonName,
    this.buttonStyle,
    this.onPressButton,
  }) : super(key: key);

  final double? dialogWidth;

  /// Set width of dialog
  ///
  /// Default value is MediaQuery.of(context).size.width
  final double? dialogHeight;

  /// Set height of dialog
  ///
  /// Dialog content 3 parts: title for the top, content for the center,
  /// Button for the bottom
  ///
  /// Default value is 300

  final double? topDialogWidth;

  /// Set width of top dialog
  ///
  /// Default value is MediaQuery.of(context).size.width
  final double? topDialogHeight;

  /// Set height of top dialog
  ///
  /// Default value is 80
  final Color? topDialogColor;

  /// Set top dialog color
  ///
  /// default value is Color.fromRGBO(118, 80, 193, 1)
  final String? title;

  /// Title of dialog
  ///
  /// If [Title] not set, default value is 'Title'
  final TextStyle? titleStyle;

  /// Style of title as [TextStyle]
  ///
  /// Default is TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)

  final double? centerDialogWidth;

  /// Set center dialog width
  ///
  /// Default value is MediaQuery.of(context).size.width
  final double? centerDialogHeight;

  /// Set center dialog height
  ///
  /// Default value is 130
  final String? content;

  /// Content of dialog
  ///
  /// Deafault value is Lorem ipsum dolor sit amet, consectetur adipiscing elit,
  /// sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  /// quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
  final TextStyle? contentStyle;

  /// Content of dialog as [TextStyle]
  ///
  /// TextStyle(fontWeight: FontWeight.w600)
  final double? buttonWidth;

  /// Width of button
  ///
  /// Default: MediaQuery.of(context).size.width
  final double? buttonHeight;

  /// Height of button
  ///
  /// Default: 50
  final Color? buttonColor;

  /// Button color:
  ///
  /// Default: Color.fromRGBO(12, 209, 211, 1)
  final String? buttonName;

  /// Button name
  final TextStyle? buttonStyle;

  ///Button style as TextStyle
  ///
  /// Default is TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
  final Function? onPressButton;

  /// Function when press button
  ///
  /// If not provide, will call: Navigator.pop(context) to close dialog

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
        height: widget.dialogHeight ?? ScreenUtil().setHeight(300),
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
          widget.title ?? 'TTTLE',
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
          ScreenUtil().setHeight(130),
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
      height: widget.buttonHeight ??
          widget.dialogHeight ??
          ScreenUtil().setHeight(50),
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
