import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Dialog', () {
    /// Test display example screen
    testWidgets('Test display dialog', (WidgetTester tester) async {
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

    /// Test basic dialog
    testWidgets('Test showing basic dialog', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      // Tap the button.
      await tester.tap(find.widgetWithText(InkWell, 'Basic Dialog'));
      // Rebuild the widget after the state has changed.
      await tester.pump();
      // Expect to find the item on screen.
      expect(find.text('tittle'), findsOneWidget);
      expect(find.text('Your message'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
      // Tap close button
      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();
      expect(find.text('tittle'), findsNothing);
    });

    /// Test info dialog
    testWidgets('Test showing info dialog', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      // Tap the button.
      await tester.tap(find.widgetWithText(InkWell, 'Info Dialog'));
      // Rebuild the widget after the state has changed.
      await tester.pump();
      // Expect to find the item on screen.
      expect(find.text('Info Dialog'), findsOneWidget);
      expect(find.text('TITTLE'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsNothing);
      expect(find.byType(RawMaterialButton), findsWidgets);
      // Tap OK button
      await tester.tap(find.widgetWithText(RawMaterialButton, 'OK'));
      await tester.pump();
      expect(find.text('TITTLE'), findsNothing);
      expect(find.widgetWithText(RawMaterialButton, 'OK'), findsNothing);
      expect(find.text('Info Dialog'), findsOneWidget);
    });

    /// Test no connection dialog
    testWidgets('Test no internet connection dialog',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      // Tap the button.
      await tester.tap(find.widgetWithText(InkWell, 'No Internet Connection'));
      // Rebuild the widget after the state has changed.
      await tester.pump();
      // Expect to find the item on screen.
      expect(find.text('No Internet Connection'), findsOneWidget);
    });

    /// Test payment dialog
    testWidgets('Test payment dialog', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      // Tap the button.
      await tester.tap(find.widgetWithText(InkWell, 'Payment Dialog'));
      // Rebuild the widget after the state has changed.
      await tester.pump();
      // Expect to find the item on screen.
      expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);
      expect(find.text('SUCCESSFUL'), findsOneWidget);
      expect(find.text('Thank you for the payment'), findsOneWidget);
      expect(find.widgetWithText(RawMaterialButton, 'OK'), findsOneWidget);
      // tap OK button
      await tester.tap(find.widgetWithText(RawMaterialButton, 'OK'));
      await tester.pump();
      expect(find.text('SUCCESSFUL'), findsNothing);
    });

    /// Test rating dialog
    testWidgets('Test rating dialog', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      // Tap the button.
      await tester.tap(find.widgetWithText(InkWell, 'Rating dialog'));
      // Rebuild the widget after the state has changed.
      await tester.pump();
      // Expect to find the item on screen.
      expect(
          find.byIcon(
            Icons.star_border,
          ),
          findsNWidgets(5));
      expect(
          find.byIcon(
            Icons.star,
          ),
          findsNothing);
      expect(find.text('Enjoying MyApp ?'), findsOneWidget);
      expect(find.text('Tap a start to rate it on the App Store.'),
          findsOneWidget);
      await tester.tap(find.widgetWithText(InkWell, 'Submit'));
      await tester.pump();
      expect(find.widgetWithText(InkWell, 'Submit'), findsNothing);
    });
  });
}
