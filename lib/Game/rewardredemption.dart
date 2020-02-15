import 'package:VIL/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AuthServices _auth;
class RewardRedemptionPage extends StatefulWidget {
  String userid;
  int reward;

  RewardRedemptionPage(String s, int r,AuthServices _a) {
    this.userid = s;
    this.reward = r;
    _auth = _a;
  }

  @override
  _RewardRedemptionPageState createState() => _RewardRedemptionPageState();
}

class _RewardRedemptionPageState extends State<RewardRedemptionPage> {
  
  @override
  Widget build(BuildContext context) {
    _auth.start(widget.userid);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Vodafone Idea Limited',
                  style: TextStyle(color: Colors.black)),
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
            body: RefreshIndicator(
              onRefresh: ()
              {
                _auth.start(widget.userid);
              },
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Total Reward Points: ${_auth.reward}",
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        // color: Colors.grey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                      icon: new Icon(FontAwesomeIcons.linkedinIn),
                                      iconSize: 85.0,
                                      onPressed: null),
                                  Text(
                                    "LPG",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            Text('${_auth.getcategorymin('LPG')}'),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Container(
                        // color: Colors.grey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                      icon: new Icon(FontAwesomeIcons.pizzaSlice),
                                      iconSize: 85.0,
                                      onPressed: null),
                                  Text(
                                    "Foods",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            Text("API CALL points"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Container(
                        // color: Colors.grey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                      icon: new Icon(FontAwesomeIcons.plusCircle),
                                      iconSize: 85.0,
                                      onPressed: null),
                                  Text(
                                    "Healthcare",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            Text("API CALL points"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        // color: Colors.grey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                      icon:
                                          new Icon(FontAwesomeIcons.shoppingCart),
                                      iconSize: 85.0,
                                      onPressed: null),
                                  Text(
                                    "Shopping",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            Text("API CALL points"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Container(
                        // color: Colors.grey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                      icon: new Icon(
                                          FontAwesomeIcons.planeDeparture),
                                      iconSize: 85.0,
                                      onPressed: null),
                                  Text(
                                    "Travel",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            Text("API CALL points"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Container(
                        // color: Colors.grey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                      icon: new Icon(FontAwesomeIcons.laptop),
                                      iconSize: 85.0,
                                      onPressed: null),
                                  Text(
                                    "Working",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            Text("API CALL points"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        // color: Colors.grey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                      icon: new Icon(FontAwesomeIcons.gamepad),
                                      iconSize: 85.0,
                                      onPressed: null),
                                  Text(
                                    "NWE",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            Text("API CALL points"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Container(
                        // color: Colors.grey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                      icon: new Icon(FontAwesomeIcons.piggyBank),
                                      iconSize: 85.0,
                                      onPressed: null),
                                  Text(
                                    "Bank&Finance",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            Text("API CALL points"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
