import 'package:VIL/Game/games.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'quiz_brain.dart';
import 'package:VIL/Services/auth.dart';

QuizBrain quizBrain = QuizBrain();

List<Widget> scoreKeeper = [];
int points = 0;

//keep it less than 12
int maxLengthofQuiz = 10;

// class Quizzler extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.grey[800],
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: QuizPage(),
//           ),
//         ),
//       ),
//     );
//   }
// }

class QuizPage extends StatefulWidget {
  String userid;
  QuizPage(String us)
  {
    this.userid = us;
  }
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final AuthServices _authen = new AuthServices();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[800],
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Text(
                          "Current Points : $points",
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 5.0),
                      child: Center(
                        child: Text(
                          quizBrain.getQuestionText(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text(
                          'True',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          bool result = quizBrain.getCorrectAnswer();
                          setState(() {
                            if (scoreKeeper.length < maxLengthofQuiz) {
                              scoreKeeper.add(
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                              );
                              if (quizBrain.getCorrectAnswer() == true) {
                                points += 10;
                              }
                              quizBrain.nextQuestion();
                            } else {
                              _authen.updateReward(widget.userid, points);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuizRewardPage(widget.userid)),
                              );
                            }
                          });
                          print(result == true);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: FlatButton(
                        color: Colors.red,
                        child: Text(
                          'False',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          bool result = quizBrain.getCorrectAnswer();

                          setState(() {
                            if (scoreKeeper.length < maxLengthofQuiz) {
                              scoreKeeper.add(
                                Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                              );
                              if (quizBrain.getCorrectAnswer() == false) {
                                points += 10;
                              }
                              quizBrain.nextQuestion();
                            } else {
                             _authen.updateReward(widget.userid, points);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuizRewardPage(widget.userid)),
                              );
                            }
                          });
                          print(result == false);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        children: scoreKeeper,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}

class QuizRewardPage extends StatelessWidget {
  String userid;
  QuizRewardPage(String us)
  {
    this.userid = us;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Result"),),
      body: Column(
        children: <Widget>[
          Center(child: Text(
              'Points = $points',
              style: new TextStyle(
                fontSize: 30,
              ),
          )
          ),
          FlatButton(
              //TODO: Clear the navigator to fresh start
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Games(this.userid)),
                );
              },
              child: null)
        ],
      ),
    );
  }
}
