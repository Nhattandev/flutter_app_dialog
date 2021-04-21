import 'package:flutter_app_dialog/flutter_app_dialog.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  // Define a test.
  testWidgets('Test BasicDialog', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(BasicDialog(tittle: 'Example tittle', content: 'Example content',));


    // Create the Finders.
    final titleFinder = find.text('Example tittle');
    final messageFinder = find.text('Example content');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

}
