# flutter_app_dialog

flutter app dialog
A Flutter plugin for iOS and Android for simple and easy implement dialogs.

## Installation

Add `flutter_app_dialog` to your `pubspec.yaml` dependencies. 
## Example
### Basic Dialog
<img src="https://github.com/Nhattandev/flutter_app_dialog/blob/master/doc/basic_dialog.png?raw=true" width="240"/>

```
 showDialog(
              context: context,
              builder: (BuildContext context) {
                return BaseDialogWidget(
                  child: BasicDialog(
                    title: 'tittle',
                    content: 'Your message',
                    titleStyle: TextStyle(color: Colors.blue),
                    iconColor: Colors.red,
                    contentStyle: TextStyle(color: Colors.blue),
                  ),
                );
              });
```
### Info Dialog
<img src="https://github.com/Nhattandev/flutter_app_dialog/blob/master/doc/info_dialog.png?raw=true" width="240"/>

```
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BaseDialogWidget(
                    child: InfoDialog(
                      title: 'Info Dialog',
                      content: 'Your message',
                      titleStyle: TextStyle(color: Colors.blue),
                      contentStyle: TextStyle(color: Colors.blue),
                    ),
                  );
                });
```
### No Internet Connection Dialog
<img src="https://github.com/Nhattandev/flutter_app_dialog/blob/master/doc/no_internet_connection.png?raw=true" width="240"/>

```
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BaseDialogWidget(
                    child: NoInternetConnectionDialog(
                      title: 'No internet connection',
                      content: 'Please check your connection status and try again',
                    ),
                  );
                });
```
### Payment Dialog
<img src="https://github.com/Nhattandev/flutter_app_dialog/blob/master/doc/payment_dialog.png?raw=true" width="240"/>

```
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BaseDialogWidget(
                    child: PaymentDialog(
                      icon: Icons.check_circle_outline,
                      iconColor: Color.fromRGBO(126, 211, 33, 1),
                      iconSize: 50,
                      paymentStatus: 'SUCCESSFUL',
                      message: 'Thank you for the payment',
                      buttonName: 'OK',
                      onPressButton: () {
                        print('On Press!');
                      },
                    ),
                  );
                });
```
### Rating Dialog
<img src="https://github.com/Nhattandev/flutter_app_dialog/blob/master/doc/rating_dialog.png?raw=true" width="240"/>

```
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BaseDialogWidget(
                    child: RatingDialog(
                      title: 'Enjoying MyApp',
                      titleStyle: TextStyle(color: Color.fromRGBO(42, 42, 48, 1), fontWeight: FontWeight.bold),
                      description: 'Tap a start to rate it on the App Store.',
                      positiveRatingColor: Colors.blue,
                      negativeRatingColor: Colors.blue,
                      positiveButtonName: 'Submit',
                      negativeButtonName: 'Cancel',
                      onRatingSubmit: (value) {
                        debugLog('Rating value: $value');
                      },
                    ),
                  );
                });
```