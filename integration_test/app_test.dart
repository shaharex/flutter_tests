import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_flut/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end test", () {
    testWidgets("tap on the floating action button, vefiry counter", (tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text("0"), findsOneWidget);
      
      await tester.tap(find.byType(FloatingActionButton));

      await tester.pumpAndSettle();

      expect(find.text("1"), findsOneWidget);
    });
  });
}