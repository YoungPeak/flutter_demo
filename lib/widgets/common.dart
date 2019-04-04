import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(wordPair.toString()),
    );
  }

}

class TapBoxA extends StatefulWidget {

  TapBoxA({Key key}) : super(key: key);

  @override
  _TapBoxAState createState() {
    return new _TapBoxAState();
  }

}

class _TapBoxAState extends State<TapBoxA> {

  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? "Active" : "Inactive",
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }

}

class TapBox extends StatefulWidget {

  @override
  _TapBoxState createState() => new _TapBoxState();

}

class TapBoxB extends StatelessWidget {

  TapBoxB({Key key, this.active: false, @required this.onChanged}) : super(key : key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {

    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }

}

class _TapBoxState extends State<TapBox> {

  bool _active = false;

  void _handleTapBoxChanged(bool newVal) {

    setState(() {
      _active = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: TapBoxB(
        active: _active,
        onChanged: _handleTapBoxChanged,
      ),
    );
  }
}