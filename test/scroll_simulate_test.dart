import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_flut/scroll_simulate.dart';

void main() {
  testWidgets("Scrolling works correctly", (tester) async {
    await tester.pumpWidget(MyApp(items: List<String>.generate(10000, (i) => "Item $i")));

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    await tester.scrollUntilVisible(itemFinder, 500.0, scrollable: listFinder);

    expect(itemFinder, findsOneWidget);
  });
}