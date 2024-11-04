import 'package:flutter_test/flutter_test.dart';
import 'package:testing_flut/counter.dart';

void main() {
  // this is unit testing, 
  // unit test tests single function, method, or class
  // here i test the counter class
  group("Running unit tests to test counter's work", () {
    test("Counter value should be incremented and then decremnted", () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);

      counter.decrement();
      counter.decrement();
      counter.decrement();

      expect(counter.value, -2);
    });
    test("Counter value should be decremented", () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
