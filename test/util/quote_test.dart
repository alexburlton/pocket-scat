import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pocket_scat/util/file_sharer.dart';
import 'package:pocket_scat/util/injected_things.dart';
import 'package:pocket_scat/util/quote_source.dart';
import 'package:pocket_scat/util/quote.dart';

import 'mocks.dart';
import 'quote_test.mocks.dart';

@GenerateMocks([AudioCache, AudioPlayer, FileSharer])
void main() {
  group('search', () {
    test('should always contain an empty search', () {
      const quote = Quote('file_name', 'bar', SRC_TOAST, '');
      expect(quote.containsSearchTerm(''), true);
    });

    test('should be searchable by name', () {
      const quote = Quote('file_name', 'Some Text', SRC_TOAST, '');
      expect(quote.containsSearchTerm('Some Text'), true);
      expect(quote.containsSearchTerm('sOmE tExT'), true);
      expect(quote.containsSearchTerm('some'), true);
      expect(quote.containsSearchTerm('text'), true);
      expect(quote.containsSearchTerm('other text'), false);
    });

    test('should be searchable by search string', () {
      const quote = Quote('file_name', 'Some Text', SRC_TOAST, 'the quote is actually this');
      expect(quote.containsSearchTerm('the quote is actually this'), true);
      expect(quote.containsSearchTerm('aCtUALLy'), true);
      expect(quote.containsSearchTerm('tual'), true);
      expect(quote.containsSearchTerm('not this'), false);
    });

    test('should be searchable by quote source', () {
      const quote = Quote('file_name', 'Some Text', SRC_TOAST, '');
      expect(quote.containsSearchTerm('toast of london'), true);
      expect(quote.containsSearchTerm('curb'), false);
    });
  });

  group('getImage', () {
    test('should return its own image path if one is specified', () {
      const quote = Quote('file_name', 'Some text', SRC_TOAST, 'some search terms', 'my_custom_image');
      final img = quote.getImage();

      expect(img.keyName, 'assets/images/my_custom_image.png');
    });

    test('should fall back on source image path if not specified', () {
      const quote = Quote('file_name', 'Some text', SRC_TOAST, 'some search terms');
      final img = quote.getImage();

      expect(img.keyName, 'assets/images/toast.png');
    });
  });

  group('playback', () {
    test('should play the associated audio file', () async {
      WidgetsFlutterBinding.ensureInitialized();

      const quote = Quote('file_name', 'Some text', SRC_TOAST, '');
      final audioCache = MockAudioCache();
      await quote.play();

      verify(audioCache.play('file_name.wav'));
      verifyNoMoreInteractions(audioCache);
    });

    test('should stop the previous audio player if it exists before playing a new sound', () async {
      const quoteOne = Quote('file_name', 'Some text', SRC_TOAST, '');
      const quoteTwo = Quote('other_file', 'Other text', SRC_RAINBOW, '');

      audioCache = MockAudioCache();
      final audioPlayer = MockAudioPlayer();

      when(audioCache.play('file_name.wav')).thenAnswer((_) => Future.value(audioPlayer));
      when(audioCache.play('other_file.wav')).thenAnswer((_) => Future.value(audioPlayer));

      await quoteOne.play();
      verify(audioCache.play('file_name.wav'));
      verifyZeroInteractions(audioPlayer);

      await quoteTwo.play();
      verify(audioPlayer.stop());
      verify(audioCache.play('other_file.wav'));
    });
  });

  group('sharing', () {
    test('should share the audio file', () async {
      const quote = Quote('file_name', 'Some text', SRC_TOAST, '');
      final buildContext = MockBuildContext();
      fileSharer = MockFileSharer();

      await quote.shareAudio(buildContext);

      verify(fileSharer.shareFile('Some text', 'file_name.wav', buildContext, 'media/wav'));
    });
  });
}