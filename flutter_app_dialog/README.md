# flutter_app_dialog

flutter app dialog
A Flutter plugin for iOS and Android for simple and easy implement dialogs.

## Installation

Add `flutter_app_dialog` to your `pubspec.yaml` dependencies. 
## Example
### Info Dialog
<img src="https://github.com/Nhattandev/flutter_app_dialog/blob/master/flutter_app_dialog/doc/info_dialog.png?raw=true" width="240"/>

```
showDialog(
              context: context,
              builder: (BuildContext context) {
                return BaseDialogWidget(
                  child: InfoDialog() ,
                );
              });
```
### No internet connection dialog
<img src="https://github.com/Nhattandev/flutter_app_dialog/blob/master/flutter_app_dialog/doc/no_internet_connection.png?raw=true" width="240"/>

```
showDialog(
              context: context,
              builder: (BuildContext context) {
                return BaseDialogWidget(
                  child: NoInternetConnectionDialog() ,
                );
              });
```
### Payment dialog
<img src="https://github.com/Nhattandev/flutter_app_dialog/blob/master/flutter_app_dialog/doc/payment_dialog.png?raw=true" width="240"/>

```
showDialog(
              context: context,
              builder: (BuildContext context) {
                return BaseDialogWidget(
                  child: PaymentDialog() ,
                );
              });
```