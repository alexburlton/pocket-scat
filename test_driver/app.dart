/*import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:pocket_scat/util/quote.dart';
import 'package:pocket_scat/util/quote_source.dart';
import 'package:pocket_scat/widget/app.dart';

const PIECE_OF_YOUR_BRAIN = Quote('fawlty_piece_of_your_brain', 'Piece of your brain', SRC_FAWLTY_TOWERS, 'Is this a piece of your brain Basil');
const ERRONEOUS_DISH = Quote('fawlty_erroneous_dish', 'Erroneous dish', SRC_FAWLTY_TOWERS, 'I have been given an erroneous dish');
const VERY_NICE_BRIAN = Quote('bean_very_nice_brian', 'Very nice Brian', SRC_BEAN, 'very nice brian');
const BAD_MISS = Quote('mitchell_bad_miss_1', 'Bad Miss 1', SRC_MITCHELL_AND_WEBB, 'Oh and thats a bad miss');

const TEST_QUOTES = [PIECE_OF_YOUR_BRAIN, ERRONEOUS_DISH, VERY_NICE_BRIAN, BAD_MISS];

void main () {
  const app = App(TEST_QUOTES);

  enableFlutterDriverExtension(handler: (message) => Future.value(handleMessage(app)));

  runApp(app);
}

String handleMessage(App app) {
  final state = app.getAudioPlayerState();

  if (state == null) {
    return '';
  } else {
    return _parsePlayerState(state);
  }
}

String _parsePlayerState(AudioPlayerState state) {
  switch(state) {
    case AudioPlayerState.PLAYING:
      return 'PLAYING';
    case AudioPlayerState.STOPPED:
      return 'STOPPED';
    case AudioPlayerState.PAUSED:
      return 'PAUSED';
    case AudioPlayerState.COMPLETED:
      return 'COMPLETED';
  }
}
*/