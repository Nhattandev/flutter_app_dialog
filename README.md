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
                child: BasicDialog() ,
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
                child: InfoDialog() ,
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
                child: NoInternetConnectionDialog() ,
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
                child: PaymentDialog() ,
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
                  onRatingSubmit: (value) {
                    print('Rating value: $value');
                  },
                ) ,
              );
            });
```