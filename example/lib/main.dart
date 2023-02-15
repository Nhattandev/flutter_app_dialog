import 'package:flutter/material.dart';
import 'package:flutter_app_dialog/flutter_app_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) => MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter App Dialog'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        backgroundColor: Color.fromRGBO(118, 80, 193, 1),
      ),
      body: _body(),
    );
  }

  ///Tan.nguyen 6/20/20 :build body
  Widget _body() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _baseButton(
                buttonName: 'Basic Dialog',
                dialogWidget: BasicDialog(
                  title: 'tittle',
                  content: 'Your message',
                )),
            SizedBox(
              height: 20,
            ),

            ///Tan.nguyen 6/21/20 : build info dialog
            _baseButton(buttonName: 'Info Dialog', dialogWidget: InfoDialog()),
            SizedBox(
              height: 20,
            ),

            ///Tan.nguyen 6/21/20 : build no internet connection dialog
            _baseButton(
                buttonName: 'No Internet Connection',
                dialogWidget: NoInternetConnectionDialog()),
            SizedBox(
              height: 20,
            ),

            ///Tan.nguyen 6/21/20 : build payment dialog
            _baseButton(
                buttonName: 'Payment Dialog', dialogWidget: PaymentDialog()),
            SizedBox(
              height: 20,
            ),

            ///Tan.nguyen 8/11/20 : build rating dialog
            _baseButton(
                buttonName: 'Rating dialog',
                dialogWidget: RatingDialog(
                  onRatingSubmit: (value) {
                    print('Rating value: $value');
                  },
                )),
          ],
        ),
      ),
    );
  }

  ///Tan.nguyen 6/20/20 : build base button
  Widget _baseButton({String buttonName, Widget dialogWidget}) {
    return Container(
        width: ScreenUtil().setWidth(200),
        height: ScreenUtil().setHeight(40),
        child: TextButton(
          child: Text(
            buttonName ?? '',
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color.fromRGBO(118, 80, 193, 1),
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BaseDialogWidget(
                    child: dialogWidget ?? InfoDialog(),
                  );
                });
          },
        ));
  }
}
