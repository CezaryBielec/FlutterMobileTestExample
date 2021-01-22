import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('App', () {
    FlutterDriver driver;

    setUp(() async {
      driver = await FlutterDriver.connect();
      var resetButton = find.byValueKey("reset");
      await driver.tap(resetButton);
    });

    tearDown(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("adds 50", () async {
      var add2 = find.byValueKey("add-2");
      var add3 = find.byValueKey("add-3");

      for (int i = 0; i < 10; i++) {
        await driver.tap(add3);
        await driver.tap(add2);
      }

      var counter = await driver.getText(find.byValueKey("counter"));

      expect(counter, contains("you've got above 50 points"));
    });

    test("counts to 30", () async {
      var add3 = find.byValueKey("add-3");

      for (int i = 0; i < 10; i++) {
        await driver.tap(add3);
      }
      var counterValue = await driver.getText(find.byValueKey('counter'));
      expect(counterValue, contains('30'));
    });
  });
}
