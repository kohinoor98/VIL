import 'package:VIL/Game/Quizzler/QuizzkerMain.dart';
import 'package:VIL/Game/games.dart';
import 'package:flutter/material.dart';


class QuizRewardPage extends StatefulWidget {
  QuizRewardPage(String us);
  @override
  _QuizRewardPageState createState() => _QuizRewardPageState();
}

class _QuizRewardPageState extends State<QuizRewardPage> {
  String userid;
  QuizRewardPage(String us) {
    this.userid = us;
    print(userid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Column(
        children: <Widget>[
          Center(
              child: Text(
            'Points = $points',
            style: new TextStyle(
              fontSize: 30,
            ),
          )),
          FlatButton(
              color: Colors.blue,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Games(this.userid)),
                // );

                //clear all and navigate
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Games(this.userid)),
                    (Route<dynamic> route) => false);
              },
              child: Text("EXIT TO GamePage"))
        ],
      ),
    );
  }
}
