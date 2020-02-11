import 'package:flutter/material.dart';
import 'package:VIL/Game/splash.dart';

class Games extends StatefulWidget {
  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
      ),
    );
  }
}