import 'dart:async';
import 'package:flutter/material.dart';
import 'package:VIL/Game/Ghome.dart';

class GameSplashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<GameSplashscreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Ghomepage(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Text(
          "Welcome to idea games\nPlay and Win the Rewards !",
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black,
            fontFamily: "Satisfy",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}