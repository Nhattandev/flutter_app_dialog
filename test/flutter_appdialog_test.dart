import 'package:flutter/material.dart';
import 'package:flutter_app_dialog/flutter_app_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Dialog', () {
    testWidgets('Test Basic dialog', (WidgetTester tester) async {
      await tester.pumpWidget(RootPage(
        body: BasicDialog(
          title: 'Alert',
          content: 'This is a basic dialog',
        ),
      ));
      await tester.pump();
      expect(find.text('Alert'), findsOneWidget);
      expect(find.text('This is a basic dialog'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });
    testWidgets('Test info dialog', (WidgetTester tester) async {
      await tester.pumpWidget(RootPage(
        body: InfoDialog(
          title: 'Tittle',
          content: 'This is a info dialog',
        ),
      ));
      await tester.pump();
      expect(find.text('Tittle'), findsOneWidget);
      expect(find.text('This is a info dialog'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsNothing);
    });
  });
}

class RootPage extends StatelessWidget {
  final Widget? body;

  const RootPage({Key? key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) => MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: Text('Root Page'),
              ),
              body: body)),
    );
  }
}
