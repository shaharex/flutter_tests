import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_flut/mywidget.dart';

void main() {
  group("Testing Widgets", () {
    testWidgets("MyWidget has a title and message",
        (WidgetTester tester) async {
      // creating widget using pumpWidget, we tell the tester to build it
      await tester.pumpWidget(const MyWidget(title: "T", message: "M"));

      final titleFinder = find.text('T');
      final messageFinder = find.text('M');

      // use findsOneWidget or other methods with finds,
      // don't use "T" or "M", it will lead to error
      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
    });

    testWidgets("finds a Text Widget", (tester) async {
      // this widget is not in lib, it's created there and it built by using tester
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Text("H"),
        ),
      ));

      // test is successful
      expect(find.text("H"), findsOneWidget);
    });

    testWidgets("finds a specific instance using key", (tester) async {
      // must define the key
      const key = Key('K');

      await tester.pumpWidget(MaterialApp(
          // key must be provided to widget
          key: key,
          home: Container()));

      // finding the widget using key
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets("finds a child", (tester) async {
      // there must be childWidget
      const childWidget = Padding(padding: EdgeInsets.zero);

      await tester.pumpWidget(Container(child: childWidget));

      // finding the widget using key
      expect(find.byWidget(childWidget), findsOneWidget);
    });
  });
}
