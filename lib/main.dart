// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pocket_scat/util/Quote.dart';
import 'package:pocket_scat/util/QuotesList.dart';
import 'package:dart_random_choice/dart_random_choice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Pocket Scat', home: QuotesWidget());
  }
}

class QuotesWidget extends StatefulWidget {
  @override
  QuoteState createState() => QuoteState();
}

class QuoteState extends State<QuotesWidget> {
  final TextEditingController _filter = new TextEditingController();

  AudioPlayer player;
  String searchText = "";
  List<Quote> filteredQuotes = ALL_QUOTES;
  Icon searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Pocket Scat');

  QuoteState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          searchText = "";
          filteredQuotes = ALL_QUOTES;
        });
      } else {
        setState(() {
          searchText = _filter.text;
          filteredQuotes =
              ALL_QUOTES.where((q) => q.searchStr.toLowerCase().contains(searchText.toLowerCase())).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pocket Scat",
      home: Scaffold(
          appBar: AppBar(
              title: _appBarTitle,
              backgroundColor: Colors.purple,
              leading:
                  new IconButton(icon: searchIcon, onPressed: _searchPressed),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.alarm), onPressed: _randomPressed),
            ],),

          body: GridView.count(
              crossAxisCount: 2,
              children: filteredQuotes
                  .map((quote) => Center(
                        child: ListTile(
                            title: Text(
                              '${quote.name}',
                              style: Theme.of(context).textTheme.headline,
                            ),
                            onTap: () {
                              playQuote(quote.filename);
                            }),
                      ))
                  .toList())),
    );
  }

  void _searchPressed() {
    setState(() {
      if (searchIcon.icon == Icons.search) {
        searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
          autofocus: true,
        );
      } else {
        this.searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Pocket Scat');
        filteredQuotes = ALL_QUOTES;
        _filter.clear();
      }
    });
  }

  Future _randomPressed() async {
    final element = randomChoice<Quote>(filteredQuotes);
    await playQuote(element.filename);
  }

  Future playQuote(String filename) async {
    await player?.pause();
    player = await AudioCache().play("$filename.wav");
  }
}
