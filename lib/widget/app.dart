import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_scat/util/quote.dart';

import 'searchable_quotes.dart';

class App extends StatelessWidget {
  final List<Quote> _allQuotes;

  const App(this._allQuotes);

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Pocket Scat',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purple,
        accentColor: Colors.purpleAccent,
        hintColor: Colors.white70,
      ),
      home: SearchableQuotes(_allQuotes));

  AudioPlayerState? getAudioPlayerState() => getPlaybackState();
}