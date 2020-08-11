import 'package:flutter/material.dart';
import 'package:flutter_app_dialog/flutter_app_dialog.dart';
import 'package:flutter_app_dialog/src/utils/widget_util.dart';
import 'package:rxdart/rxdart.dart';

class RatingDialog extends StatefulWidget {
  final double dialogHeight;
  final double dialogWidth;
  final Widget icon;
  final double topDialogWidth;
  final double topDialogHeight;
  final String tittle;
  final TextStyle tittleStyle;
  final String description;
  final String positiveButtonName;
  final TextStyle positiveButtonStyle;
  final String negativeButtonName;
  final String negativeButtonStyle;
  final String descriptionStyle;
  final Function onRatingSubmit;
  final Function onRatingCancel;
  final Color positiveRatingColor;
  final Color negativeRatingColor;

  const RatingDialog({
    Key key,
    this.dialogHeight,
    this.dialogWidth,
    this.icon,
    this.tittle,
    this.tittleStyle,
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
  int rateCount;

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
        height: widget.dialogHeight ?? WidgetUtil.resizeByWidth(context, 300),
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
      height: widget.topDialogHeight ?? WidgetUtil.resizeByWidth(context, 90),
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
      height: WidgetUtil.resizeByWidth(context, 40),
      child: Text(
        widget.tittle ?? 'Enjoying MyApp ?',
        textAlign: TextAlign.center,
        maxLines: 2,
        style: widget.tittleStyle ??
            TextStyle(
                fontSize: WidgetUtil.resizeByWidth(context, 20),
                color: Color.fromRGBO(42, 42, 48, 1),
                fontWeight: FontWeight.bold),
      ),
    );
  }

  ///Tan.nguyen 8/11/20 : build center description
  Widget buildCenterDescription() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: WidgetUtil.resizeByWidth(context, 40),
      child: Text(
        widget.description ?? 'Tap a start to rate it on the App Store.',
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: widget.descriptionStyle ??
            TextStyle(
              fontSize: WidgetUtil.resizeByWidth(context, 14),
              color: Color.fromRGBO(130, 131, 147, 1),
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  ///Tan.nguyen 8/11/20 : build rating button
  Widget buildRatingButton() {
    return StreamBuilder(
      stream: rateCountBloc.stream,
      initialData: 0,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          rateCount = snapshot.data;
          List<Icon> listRating = [];
          for (int i = 1; i <= 5; i++) {
            if (i <= rateCount) {
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
              height: WidgetUtil.resizeByWidth(context, 50),
              child: Center(
                child: ListView.separated(
                    separatorBuilder: ((BuildContext context, int index) => SizedBox(
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
                height: WidgetUtil.resizeByWidth(context, 40),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        if (widget.onRatingCancel != null) {
                          widget.onRatingCancel();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          widget.negativeButtonName ?? 'Cancel',
                          style: widget.negativeButtonStyle ??
                              TextStyle(fontSize: WidgetUtil.resizeByWidth(context, 20), color: Colors.blue),
                        ),
                      ),
                    ),
                    VerticalDivider(),
                    InkWell(
                      onTap: () {
                        if (widget.onRatingSubmit != null) {
                          widget.onRatingSubmit(snapshot.data);
                        }
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Text(
                          widget.negativeButtonName ?? 'Submit',
                          style: widget.negativeButtonStyle ??
                              TextStyle(fontSize: WidgetUtil.resizeByWidth(context, 20), color: Colors.blue),
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
