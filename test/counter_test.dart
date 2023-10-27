import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/counter.dart';

void main() {
  late Counter counter;

  setUp(() {
    counter = Counter();
  });

  // * Given When Then

  // * PreTest
  // setUp(() => null);
  // setUpAll(() => null);

  // * setUp is called before every test
  // * setUpAll is called before all the tests

  // * setUp -> test -> setUp -> test -> setUp -> test
  // * setUpAll -> test -> test -> test

  // * Testing
  group('Counter Class -', () {
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

    test(
      'Given Counter Class When It Is Decremented Then Value Of Count Should Be -1',
      () {
        // * Arrange

        // * Act
        counter.decrementCounter();
        final value = counter.count;

        // * Assert
        expect(value, -1); //* Real value and Guessing Value
      },
    );

    test(
      'Given Counter Class When It Is Reset Then Value Of Count Should Be 0',
      () {
        // * Arrange

        // * Act
        counter.resetCounter();
        final value = counter.count;

        // * Assert
        expect(value, 0); //* Real value and Guessing Value
      },
    );
  });

  // * Post Test
  // tearDown(() => null);
  // tearDownAll(() => null);

  // * test -> TearDown -> test -> TearDown -> test -> TearDown
  // * test -> test -> test -> TearDownAll
}
