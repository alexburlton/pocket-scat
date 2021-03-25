/*import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Pocket Scat', () {
    final searchBarFinder =  find.byType('TextField');
    final erroneousFinder = find.text('Erroneous dish');
    final brainFinder = find.text('Piece of your brain');
    final searchFinder = find.byType('IconButton');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('can filter by search and cancel search', () async {
      expect(await driver.isPresent(searchBarFinder), false);
      expect(await driver.isPresent(erroneousFinder), true);
      expect(await driver.isPresent(brainFinder), true);

      await driver.tap(searchFinder);
      expect(await driver.isPresent(searchBarFinder), true);

      await driver.enterText('piece');
      await driver.sleep(const Duration(milliseconds: 500));
      expect(await driver.isPresent(erroneousFinder), false);
      expect(await driver.isPresent(brainFinder), true);

      await driver.tap(searchFinder);
      expect(await driver.isPresent(searchBarFinder), false);
      expect(await driver.isPresent(erroneousFinder), true);
      expect(await driver.isPresent(brainFinder), true);
    });

    test('can play back quotes', () async {
      expect(await driver.getPlaybackStatus(), '');

      await driver.tap(brainFinder);
      await driver.sleep(const Duration(milliseconds: 500));
      expect(await driver.getPlaybackStatus(), 'PLAYING');

      await driver.sleep(const Duration(seconds: 3));
      expect (await driver.getPlaybackStatus(), 'COMPLETED');
    });

    /**
     * Doesn't seem to be possible to verify that the share window appears. See e.g. https://stackoverflow.com/questions/58352785/how-to-run-integration-test-for-share-dialog-in-flutter
     */
//    test('can share quotes', () async {
//      expect(await driver.isPresent(brainFinder), true);
//
//      await driver.longPress(brainFinder);
//
//      expect(await driver.isPresent(find.text('Share'),  timeout: Duration(seconds: 5)), true);
//      expect(await driver.isPresent(find.text('fawlty_piece_of_your_brain.wav')), true);
//
//      await driver.tap(brainFinder);
//
//      expect(await driver.isPresent(find.text('Share'), timeout: Duration(seconds: 5)), false);
//      expect(await driver.isPresent(find.text('fawlty_piece_of_your_brain.wav')), false);
//    });
  });
}

extension DriverMethods on FlutterDriver {
  Future<bool> isPresent(SerializableFinder finder, {Duration timeout = const Duration(seconds: 1)}) async {
    try {
      await waitFor(finder, timeout: timeout);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> sleep(Duration duration) async => Future.delayed(duration);

  Future<String> getPlaybackStatus() async => requestData('');
  //Future<void> longPress(SerializableFinder finder) async => await scroll(finder, 0, 0, Duration(milliseconds: 400));
}
*/