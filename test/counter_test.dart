import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/counter.dart';

void main() {
  // * Given When Then

  // * PreTest
  setUp(() => null);
  setUpAll(() => null);

  // * Testing
  group('Counter Class -', () {
    final Counter counter = Counter();
    test(
      'Given Counter Class When It Is Instantiated Then Value Of Count Should Be 0',
      () {
        // * Arrange

        // * Act
        final value = counter.count;

        // * Assert
        expect(value, 0); //* Real value and Guessing Value
      },
    );

    test(
      'Given Counter Class When It Is Incremented Then Value Of Count Should Be 1',
      () {
        // * Arrange

        // * Act
        counter.incrementCounter();
        final value = counter.count;

        // * Assert
        expect(value, 1); //* Real value and Guessing Value
      },
    );
  });

  // * Post Test
  tearDown(() => null);
  tearDownAll(() => null);
}
