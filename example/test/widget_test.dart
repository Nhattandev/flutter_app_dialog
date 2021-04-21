import 'package:example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test display dialog', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MyApp());

    final basicDialogFinder = find.text('Basic Dialog');
    final infoDialogFinder = find.text('Info Dialog');
    final noConnectionDialogFinder = find.text('No Internet Connection');
    final paymentDialogFinder = find.text('Payment Dialog');
    final ratingDialogFinder = find.text('Rating dialog');

    expect(basicDialogFinder, findsOneWidget);
    expect(infoDialogFinder, findsOneWidget);
    expect(noConnectionDialogFinder, findsOneWidget);
    expect(paymentDialogFinder, findsOneWidget);
    expect(ratingDialogFinder, findsOneWidget);
  });
}
