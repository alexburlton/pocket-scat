import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_scat/util/quote.dart';

class QuoteButton extends StatelessWidget {
  final Quote _quote;

  const QuoteButton(this._quote);

  @override
  Widget build(BuildContext context) => GestureDetector(
      onLongPress: () {
        _quote.shareAudio(context);
      },
      child: CupertinoButton(
        child: Stack(children: <Widget>[
          Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(image: _quote.getImage()),
                borderRadius: BorderRadius.circular(12),
              )),
          _buildTextOverlay(context)
        ]),
        onPressed: _quote.play,
      ));

  Widget _buildTextOverlay(BuildContext context) => Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.75),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Text(
              _quote.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            )),
      ));
}
