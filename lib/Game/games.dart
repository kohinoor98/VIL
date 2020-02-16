import 'package:VIL/Game/Ghome.dart';
import 'package:VIL/Game/game_swarm/game_controller.dart';
import 'package:VIL/Services/auth.dart';
import 'package:flutter/cupertino.dart';
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
    // _auth.getData();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Games'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                const Color(0xFFE00201),
                const Color(0xFFE00201),

                // const Color(0xFF00c3ff),
                // const Color(0xFFffff1c),
              ])),
        ),
      ),
      body: ListView(
        children: <Widget>[
          // getCard(
          //   title: 'Quiz', //NWE
          //   color: Colors.redAccent,
          //   icon: Icons.question_answer,
          //   onClick: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => Ghomepage(widget.userid),
          //       ),
          //     );
          //   },
          // ),
          Card(
            // color: Color.fromRGBO(58, 66, 86, 1.0),
            elevation: 3.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
              onLongPress: () {
                showDialog(
                    context: context,
                    child: new CupertinoAlertDialog(
                      title: new Text("Alert"),
                      content: new Text(
                        "On this page you can see the Slots available for doctors in the hospital and select you rappointments accordingly",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Noto',
                        ),
                      ),
                      actions: <Widget>[
                        new CupertinoDialogAction(
                            child: const Text('OK'),
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop("OK");
                            }),
                      ],
                    ));
              },
              leading: Container(
                padding: EdgeInsets.only(
                  right: 12.0,
                ),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.black))),
                child: Image.asset(
                  'assets/quiz.jpg',
                  width: 65.0,
                  height: 65.0,
                ),
              ),
              title: Text(
                "Quiz",
                style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
              ),
              subtitle: Text("Weekly play this game to earn 100 Points"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                _auth.updateSpyder(widget.userid, "NWE Spyder", 0.1);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Ghomepage(widget.userid),
                  ),
                );
              },
            ),
          ),
          Card(
            // color: Color.fromRGBO(58, 66, 86, 1.0),
            elevation: 3.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
              onLongPress: () {
                showDialog(
                    context: context,
                    child: new CupertinoAlertDialog(
                      title: new Text("Alert"),
                      content: new Text(
                        "On this page you can see the Slots available for doctors in the hospital and select you rappointments accordingly",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Noto',
                        ),
                      ),
                      actions: <Widget>[
                        new CupertinoDialogAction(
                            child: const Text('OK'),
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop("OK");
                            }),
                      ],
                    ));
              },
              leading: Container(
                padding: EdgeInsets.only(
                  right: 12.0,
                ),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.black))),
                child: Image.asset(
                  'assets/cricket.jpeg',
                  width: 65.0,
                  height: 65.0,
                ),
              ),
              title: Text(
                "Cricket Plaza",
                style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
              ),
              subtitle: Text("Worth 25 Reward Points!!!"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                _auth.updateSpyder(widget.userid, "NWE Spyder", 0.1);
              },
            ),
          ),
          Card(
            // color: Color.fromRGBO(58, 66, 86, 1.0),
            elevation: 3.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
              onLongPress: () {
                showDialog(
                    context: context,
                    child: new CupertinoAlertDialog(
                      title: new Text("Alert"),
                      content: new Text(
                        "On this page you can see the Slots available for doctors in the hospital and select you rappointments accordingly",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Noto',
                        ),
                      ),
                      actions: <Widget>[
                        new CupertinoDialogAction(
                            child: const Text('OK'),
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop("OK");
                            }),
                      ],
                    ));
              },
              leading: Container(
                padding: EdgeInsets.only(
                  right: 12.0,
                ),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.black))),
                child: Image.asset(
                  'assets/fruitNinja.png',
                  width: 65.0,
                  height: 65.0,
                ),
              ),
              title: Text(
                "Fruit Ninja",
                style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
              ),
              subtitle: Text("Fruit Ninja, etc"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                _auth.updateSpyder(widget.userid, "Food Spyder", 0.1);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GameController().widget ,
                  ),
                );
              },
            ),
          ),
          Card(
            // color: Color.fromRGBO(58, 66, 86, 1.0),
            elevation: 3.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
              onLongPress: () {
                showDialog(
                    context: context,
                    child: new CupertinoAlertDialog(
                      title: new Text("Alert"),
                      content: new Text(
                        "On this page you can see the Slots available for doctors in the hospital and select you rappointments accordingly",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Noto',
                        ),
                      ),
                      actions: <Widget>[
                        new CupertinoDialogAction(
                            child: const Text('OK'),
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop("OK");
                            }),
                      ],
                    ));
              },
              leading: Container(
                padding: EdgeInsets.only(
                  right: 12.0,
                ),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.black))),
                child: Image.asset(
                  'assets/hospital.jpeg',
                  width: 65.0,
                  height: 65.0,
                ),
              ),
              title: Text(
                "Block Builder",
                style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
              ),
              subtitle: Text("Doctor practice, Surgery Expert, etc"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                _auth.updateSpyder(widget.userid, "HealthCare Spyder", 0.1);
              },
            ),
          ),
          Card(
            // color: Color.fromRGBO(58, 66, 86, 1.0),
            elevation: 3.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
              onLongPress: () {
                showDialog(
                    context: context,
                    child: new CupertinoAlertDialog(
                      title: new Text("Alert"),
                      content: new Text(
                        "On this page you can see the Slots available for doctors in the hospital and select you rappointments accordingly",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Noto',
                        ),
                      ),
                      actions: <Widget>[
                        new CupertinoDialogAction(
                            child: const Text('OK'),
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop("OK");
                            }),
                      ],
                    ));
              },
              leading: Container(
                padding: EdgeInsets.only(
                  right: 12.0,
                ),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.black))),
                child: Image.asset(
                  'assets/shoppingGame.png',
                  width: 65.0,
                  height: 65.0,
                ),
              ),
              title: Text(
                "Stroller",
                style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
              ),
              subtitle: Text("Shopping Mania, supermarket shopping, etc"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                _auth.updateSpyder(widget.userid, "Shopping Spyder", 0.1);
              },
            ),
          ),
          Card(
            // color: Color.fromRGBO(58, 66, 86, 1.0),
            elevation: 3.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
              onLongPress: () {
                showDialog(
                    context: context,
                    child: new CupertinoAlertDialog(
                      title: new Text("Alert"),
                      content: new Text(
                        "On this page you can see the Slots available for doctors in the hospital and select you rappointments accordingly",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Noto',
                        ),
                      ),
                      actions: <Widget>[
                        new CupertinoDialogAction(
                            child: const Text('OK'),
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop("OK");
                            }),
                      ],
                    ));
              },
              leading: Container(
                padding: EdgeInsets.only(
                  right: 12.0,
                ),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.black))),
                child: Image.asset(
                  'assets/findthehidden.png',
                  width: 65.0,
                  height: 65.0,
                ),
              ),
              title: Text(
                "Find the Hidden",
                style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
              ),
              subtitle: Text("Cricket, Football, Basketball and more"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                _auth.updateSpyder(widget.userid, "Travel Spyder", 0.1);
               // print("\n\n\n\ngggg\n\n\n");
              },
            ),
          ),
          Card(
            // color: Color.fromRGBO(58, 66, 86, 1.0),
            elevation: 3.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
              onLongPress: () {
                showDialog(
                    context: context,
                    child: new CupertinoAlertDialog(
                      title: new Text("Alert"),
                      content: new Text(
                        "On this page you can see the Slots available for doctors in the hospital and select you rappointments accordingly",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Noto',
                        ),
                      ),
                      actions: <Widget>[
                        new CupertinoDialogAction(
                            child: const Text('OK'),
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop("OK");
                            }),
                      ],
                    ));
              },
              leading: Container(
                padding: EdgeInsets.only(
                  right: 12.0,
                ),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.black))),
                child: Image.asset(
                  'assets/pow.png',
                  width: 65.0,
                  height: 65.0,
                ),
              ),
              title: Text(
                "Pow", //News and Entertainment Gaming
                style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
              ),
              subtitle: Text("Cricket, Football, Basketball and more"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                _auth.updateSpyder(widget.userid, "Working and Productive Spyder", 0.1);
              },
            ),
          ),
          Card(
            // color: Color.fromRGBO(58, 66, 86, 1.0),
            elevation: 3.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
              onLongPress: () {
                showDialog(
                    context: context,
                    child: new CupertinoAlertDialog(
                      title: new Text("Alert"),
                      content: new Text(
                        "On this page you can see the Slots available for doctors in the hospital and select you rappointments accordingly",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Noto',
                        ),
                      ),
                      actions: <Widget>[
                        new CupertinoDialogAction(
                            child: const Text('OK'),
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop("OK");
                            }),
                      ],
                    ));
              },
              leading: Container(
                padding: EdgeInsets.only(
                  right: 12.0,
                ),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.black))),
                child:  Image.asset(
                  'assets/bankingJunior.png',
                  width: 65.0,
                  height: 65.0,
                ),
              ),
              title: Text(
                "Investment Banker Jr.",
                style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
              ),
              subtitle: Text("Cricket, Football, Basketball and more"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                _auth.updateSpyder(widget.userid, "Banking Spyder", 0.1);
              },
            ),
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
