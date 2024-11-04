import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_flut/todo.dart';

void main() {
  group("Testing the widgets which interact with user", () {
    testWidgets("Test the textfield input text", (tester) async {
      await tester.pumpWidget(const TodoList());

      // entering text and finding it
      await tester.enterText(find.byType(TextField), "shaha");
    });

    testWidgets("Add a todo", (tester) async {
      await tester.pumpWidget(const TodoList());

      await tester.enterText(find.byType(TextField), "shaha");

      // adding the text to list tapping the button
      await tester.tap(find.byType(FloatingActionButton));
      // rebuilding the widget after the state changes
      await tester.pump();

      expect(find.text("shaha"), findsOneWidget);
    });

    testWidgets("Remove a todo", (tester) async {
      // building a widget
      await tester.pumpWidget(const TodoList());

      // entering text
      await tester.enterText(find.byType(TextField), "shaha");

      // adding the item
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      //dismissing the dismissible and removing the item from list
      await tester.drag(find.byType(Dismissible), const Offset(500, 0));
      // rebuild the widget until the dismiss animation ends
      await tester.pumpAndSettle();

      expect(find.text("shaha"), findsNothing);
    });
  });
}
