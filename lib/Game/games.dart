import 'package:VIL/Game/Ghome.dart';
import 'package:VIL/Game/Quizzler/QuizzkerMain.dart';
import 'package:VIL/Game/rewardredemption.dart';
import 'package:VIL/Services/auth.dart';
import 'package:VIL/WalletPage/src/pages/home_page.dart';
import 'package:flutter/material.dart';

AuthServices _auth = new AuthServices();

class Games extends StatefulWidget {
  String userid;
  Games(String us) {
    this.userid = us;
  }
  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {

    _auth.start(widget.userid);
    _auth.getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                const Color(0xFFFFE459),
                const Color(0xFFFFE459),

                // const Color(0xFF00c3ff),
                // const Color(0xFFffff1c),
              ])),
        ),
      ),
      body: ListView(
        children: <Widget>[
          getCard(
            title: 'Quiz',
            color: Colors.redAccent,
            icon: Icons.question_answer,
            onClick: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Ghomepage(widget.userid),
                ),
              );
            },
          ),
          getCard(
            title: 'Other Games',
            color: Colors.blueAccent,
            icon: Icons.gesture,
            onClick: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => null, // add game page here
                ),
              );
            },
          ),
          getCard(
            title: 'Manage Rewards',
            color: Colors.blueAccent,
            icon: Icons.functions,
            onClick: () {
              _auth.getData();
              _auth.start(widget.userid);
              Navigator.of(context).push(
                MaterialPageRoute(
<<<<<<< HEAD
                  builder: (context) =>
                      // RewardRedemptionPage(""),
                      LeaderBoard(widget.userid, _auth), // add game page here
=======
                  builder: (context) => null // add game page here
>>>>>>> ac80e84e66dbde9864736ecfdc1dfe57a136a157
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget getCard({String title, Color color, IconData icon, Function onClick}) {
    return Container(
      width: 200,
      height: 130,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.all(16),
        color: color,
        elevation: 10,
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                leading: Icon(icon, size: 50),
                title: Text(title ?? '', style: TextStyle(color: Colors.white)),
                contentPadding: EdgeInsets.all(16),
              ),
            ],
          ),
          onTap: onClick ?? () {},
        ),
      ),
    );
  }
}
