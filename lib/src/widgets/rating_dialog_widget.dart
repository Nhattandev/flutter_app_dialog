import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app_dialog/flutter_app_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

///Tan.nguyen 4/21/21 :
/// Define [RatingDialog] widget
///
/// Usage:
/// ```dart
/// RatingDialog(
///   tittle: 'Successful',
///   description: 'Thank you for the payment',
///   onRatingSubmit: (value) {
///   print('Rating value: $value');
///   },
/// )
/// ```
/// See also:
/// [dialogHeight] height of dialog default is 300
/// [dialogWidth] width of dialog
/// [icon] icon of rating
/// [tittle] as String: ex: enjoying my app
/// [description] display description of dialog
/// [tittle], [description] TextStyle
/// [positiveButtonName] default is 'Submit'
/// [negativeButtonName] default is 'Cancel'
/// with custom  style, etc.. via [positiveButtonStyle], [negativeButtonStyle],
/// and custom [positiveRatingColor], [negativeRatingColor]
/// [onRatingSubmit] handle func onRating submit with specific value
/// [onRatingCancel] handle func when cancel rating
///
class RatingDialog extends StatefulWidget {
  final double? dialogHeight;

  /// Set dialog height
  ///
  /// Default value is 300
  final double? dialogWidth;

  /// Dialog width
  ///
  /// Default value is MediaQuery.of(context).size.width(Full size of screen)
  final Widget? icon;

  /// Icon of rating
  final double? topDialogWidth;

  /// Top dialog width
  ///
  /// Default value is MediaQuery.of(context).size.width (full size width)
  final double? topDialogHeight;

  /// Top dialog height, default value is 90
  final String? title;

  /// Title of rating dialog
  final TextStyle? titleStyle;

  /// Title style
  final String? description;

  /// Description
  final String? positiveButtonName;

  /// Positive button name, default is 'Submit'
  final TextStyle? positiveButtonStyle;

  /// Positive button style
  final String? negativeButtonName;

  /// Negative button name, default is 'Cancel'
  final TextStyle? negativeButtonStyle;

  /// Negative button style
  final TextStyle? descriptionStyle;

  /// Description style
  final Function? onRatingSubmit;

  /// Function when click to rating icon, result is value as [Int] ex: 1,2,3,4,5
  ///
  /// Value is 3 meaning 3/5 point
  final Function? onRatingCancel;

  /// Function when user cancel rating after close dialog
  final Color? positiveRatingColor;

  /// Positive rating color
  final Color? negativeRatingColor;

  /// Negative rating color

  const RatingDialog({
    Key? key,
    this.dialogHeight,
    this.dialogWidth,
    this.icon,
    this.title,
    this.titleStyle,
    this.description,
    this.descriptionStyle,
    this.onRatingSubmit,
    this.onRatingCancel,
    this.topDialogWidth,
    this.topDialogHeight,
    this.positiveButtonName,
    this.positiveButtonStyle,
    this.negativeButtonName,
    this.negativeButtonStyle,
    this.positiveRatingColor,
    this.negativeRatingColor,
  }) : super(key: key);

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int? rateCount;

  final rateCountBloc = BehaviorSubject<int>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    rateCountBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.dialogHeight ?? ScreenUtil().setHeight(300),
        width: widget.dialogWidth ?? MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildTopImage(),
              buildCenterTittle(),
              buildCenterDescription(),
              DividerLine(),
              buildRatingButton(),
              DividerLine(),
              SizedBox(
                height: 20,
              ),
              buildActionButton(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }

  ///Tan.nguyen 8/11/20 : build top image
  Widget buildTopImage() {
    return Container(
      width: widget.topDialogWidth ?? MediaQuery.of(context).size.width,
      height: widget.topDialogHeight ?? ScreenUtil().setHeight(90),
      child: Center(
        child: widget.icon ??
            FlutterLogo(
              size: 70,
            ),
      ),
    );
  }

  ///Tan.nguyen 8/11/20 : build center tittle
  Widget buildCenterTittle() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil().setHeight(40),
      child: Text(
        widget.title ?? 'Enjoying MyApp ?',
        textAlign: TextAlign.center,
        maxLines: 2,
        style: widget.titleStyle ??
            TextStyle(
                fontSize: ScreenUtil().setSp(20),
                color: Color.fromRGBO(42, 42, 48, 1),
                fontWeight: FontWeight.bold),
      ),
    );
  }

  ///Tan.nguyen 8/11/20 : build center description
  Widget buildCenterDescription() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil().setHeight(40),
      child: Text(
        widget.description ?? 'Tap a start to rate it on the App Store.',
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: widget.descriptionStyle ??
            TextStyle(
              fontSize: ScreenUtil().setSp(14),
              color: Color.fromRGBO(130, 131, 147, 1),
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  ///Tan.nguyen 8/11/20 : build rating button
  Widget buildRatingButton() {
    return StreamBuilder<int>(
      stream: rateCountBloc.stream,
      initialData: 0,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          rateCount = snapshot.data;
          List<Icon> listRating = [];
          for (int i = 1; i <= 5; i++) {
            if (i <= rateCount!) {
              listRating.add((Icon(
                Icons.star,
                size: 40,
                color: widget.positiveRatingColor ?? Colors.blue,
              )));
            } else {
              listRating.add((Icon(
                Icons.star_border,
                size: 40,
                color: widget.negativeRatingColor ?? Colors.blue,
              )));
            }
          }
          return Container(
              width: MediaQuery.of(context).size.width,
              height: ScreenUtil().setHeight(50),
              child: Center(
                child: ListView.separated(
                    separatorBuilder: ((BuildContext context, int index) =>
                        SizedBox(
                          width: 15,
                        )),
                    shrinkWrap: true,
                    itemCount: listRating.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          rateCountBloc.sink.add(index + 1);
                        },
                        child: listRating[index],
                      );
                    }),
              ));
        } else
          return SizedBox();
      },
    );
  }

  ///Tan.nguyen 8/11/20 : buid action button
  Widget buildActionButton() {
    return StreamBuilder(
      stream: rateCountBloc.stream,
      initialData: 0,
      builder: (context, snapshot) {
        return snapshot.hasData && snapshot.data != null
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: ScreenUtil().setHeight(40),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        if (widget.onRatingCancel != null) {
                          widget.onRatingCancel!();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          widget.negativeButtonName ?? 'Cancel',
                          style: widget.negativeButtonStyle ??
                              TextStyle(
                                  fontSize: ScreenUtil().setSp(20),
                                  color: Colors.blue),
                        ),
                      ),
                    ),
                    VerticalDivider(),
                    InkWell(
                      onTap: () {
                        if (widget.onRatingSubmit != null) {
                          widget.onRatingSubmit!(snapshot.data);
                        }
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Text(
                          widget.positiveButtonName ?? 'Submit',
                          style: widget.positiveButtonStyle ??
                              TextStyle(
                                  fontSize: ScreenUtil().setSp(20),
                                  color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox();
      },
    );
  }
}
