import 'package:VIL/Services/auth.dart';
import 'package:VIL/Services/model/UserData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:VIL/Services/model/user.dart';
import 'package:audioplayers/audio_cache.dart';

//AuthServices _auth;
final AuthServices _auth = new AuthServices();
UserData userr;


class RewardRedemptionPage extends StatefulWidget {
  RewardRedemptionPage(UserData u) {
    userr = u;
  }

  @override
  _RewardRedemptionPageState createState() => _RewardRedemptionPageState();
}

class _RewardRedemptionPageState extends State<RewardRedemptionPage> {
  static AudioCache player = new AudioCache();
  int LPRvoucher;
  int foodvoucher;
  int healthvoucher;
  int showvoucher;
  int travelvoucher;
  int workingvoucher;
  int nwevoucher;
  int bankvoucher;
  int reward;
  final databaseReference = Firestore.instance;

  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user.uid);
    print("\n\n\n\nhhhh\n\n\n");
    _auth.start(userr.userId);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                'Reedem Reward',
                style: TextStyle(fontSize: 22.0),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                      Color(0xFFE00201), Color(0xFFE00201)

                      // const Color(0xFF00c3ff),
                      // const Color(0xFFffff1c),
                    ])),
              ),
            ),
            body: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Total Reward Points: ${userr.reward}",
                      style: TextStyle(
                          fontSize: 27.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          // color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                        icon: new Icon(
                                            FontAwesomeIcons.linkedinIn,
                                            color: Colors.blue),
                                        iconSize: 85.0,
                                        onPressed: () {
                                          const alarmAudioPath = "redeem.mp3";
                                          player.play(alarmAudioPath);
                                          setState(() {
                                            if (userr.reward > 10) {
                                              userr.LPRvoucher =
                                                  userr.LPRvoucher + 10;
                                              _auth.updatecategoryVoucher(
                                                  "LPG Voucher",
                                                  userr.userId,
                                                  10);
                                              _auth.updateSpyder(userr.userId,
                                                  "LPG Spyder", 0.5);
                                              userr.reward = userr.reward - 10;
                                            }
                                          });
                                        }),
                                    Text(
                                      "Lifestyle",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text('${userr.LPRvoucher}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          // color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                        icon: new Image.asset(
                                            'assets/foodIcon.png'),
                                        iconSize: 85.0,
                                        onPressed: () {
                                          const alarmAudioPath = "redeem.mp3";
                                          player.play(alarmAudioPath);
                                          setState(() {
                                            if (userr.reward > 10) {
                                              userr.foodvoucher =
                                                  userr.foodvoucher + 10;
                                              _auth.updatecategoryVoucher(
                                                  "Food Voucher",
                                                  userr.userId,
                                                  10);
                                              _auth.updateSpyder(userr.userId,
                                                  "Food Spyder", 0.5);
                                              userr.reward = userr.reward - 10;
                                            }
                                          });
                                        }),
                                    Text(
                                      "Foods",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text('${userr.foodvoucher}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          // color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                        icon: new Image.asset(
                                            'assets/healthCare.png'),
                                        iconSize: 85.0,
                                        onPressed: () {
                                          const alarmAudioPath = "redeem.mp3";
                                          player.play(alarmAudioPath);
                                          setState(() {
                                            if (userr.reward > 10) {
                                              userr.healthvoucher =
                                                  userr.healthvoucher + 10;
                                              _auth.updatecategoryVoucher(
                                                  "HealthCare Voucher",
                                                  userr.userId,
                                                  10);
                                              _auth.updateSpyder(userr.userId,
                                                  "HealthCare Spyder", 0.5);
                                              userr.reward = userr.reward - 10;
                                            }
                                          });
                                        }),
                                    Text(
                                      "Healthcare",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text('${userr.healthvoucher}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          // color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                        icon: new Image.asset(
                                            'assets/shoppingCart.png'),
                                        iconSize: 85.0,
                                        onPressed: () {
                                          const alarmAudioPath = "redeem.mp3";
                                          player.play(alarmAudioPath);
                                          setState(() {
                                            if (userr.reward > 10) {
                                              userr.showvoucher =
                                                  userr.showvoucher + 10;
                                              _auth.updatecategoryVoucher(
                                                  "Shopping Voucher",
                                                  userr.userId,
                                                  10);
                                              _auth.updateSpyder(userr.userId,
                                                  "Shopping Spyder", 0.5);
                                              userr.reward = userr.reward - 10;
                                            }
                                          });
                                        }),
                                    Text(
                                      "Shopping",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text('${userr.showvoucher}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          // color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                        icon: new Image.asset(
                                            'assets/travel.png'),
                                        iconSize: 85.0,
                                        onPressed: () {
                                          const alarmAudioPath = "redeem.mp3";
                                          player.play(alarmAudioPath);
                                          setState(() {
                                            if (userr.reward > 10) {
                                              userr.travelvoucher =
                                                  userr.travelvoucher + 10;
                                              _auth.updatecategoryVoucher(
                                                  "Travel Voucher",
                                                  userr.userId,
                                                  10);
                                              _auth.updateSpyder(userr.userId,
                                                  "Travel Spyder", 0.5);
                                              userr.reward = userr.reward - 10;
                                            }
                                          });
                                        }),
                                    Text(
                                      "Travel",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text('${userr.travelvoucher}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          // color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                        icon: new Image.asset(
                                            'assets/working.png'),
                                        iconSize: 85.0,
                                        onPressed: () {
                                          const alarmAudioPath = "redeem.mp3";
                                          player.play(alarmAudioPath);
                                          setState(() {
                                            if (userr.reward > 10) {
                                              userr.workingvoucher =
                                                  userr.workingvoucher + 10;
                                              _auth.updatecategoryVoucher(
                                                  "Working and Productive Voucher",
                                                  userr.userId,
                                                  10);
                                              _auth.updateSpyder(
                                                  userr.userId,
                                                  "Working and Productive Spyder",
                                                  0.5);
                                              userr.reward = userr.reward - 10;
                                            }
                                          });
                                        }),
                                    Text(
                                      "Working",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text('${userr.workingvoucher}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          // color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                        icon: new Image.asset(
                                            'assets/gaming.png'),
                                        iconSize: 85.0,
                                        onPressed: () {
                                          const alarmAudioPath = "redeem.mp3";
                                          player.play(alarmAudioPath);
                                          setState(() {
                                            if (userr.reward > 10) {
                                              userr.nwevoucher =
                                                  userr.nwevoucher + 10;
                                              _auth.updatecategoryVoucher(
                                                  "NWE Voucher",
                                                  userr.userId,
                                                  10);
                                              _auth.updateSpyder(userr.userId,
                                                  "NWE Spyder", 0.5);
                                              userr.reward = userr.reward - 10;
                                            }
                                          });
                                        }),
                                    Text(
                                      "NWE",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text('${userr.nwevoucher}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          // color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                        icon: new Image.asset(
                                            'assets/banking.png'),
                                        iconSize: 85.0,
                                        onPressed: () {
                                          const alarmAudioPath = "redeem.mp3";
                                          player.play(alarmAudioPath);
                                          setState(() {
                                            if (userr.reward >= 10) {
                                              userr.bankvoucher =
                                                  userr.bankvoucher + 10;
                                              _auth.updatecategoryVoucher(
                                                  "Banking Voucher",
                                                  userr.userId,
                                                  10);
                                              _auth.updateSpyder(userr.userId,
                                                  "Banking Spyder", 0.5);
                                              userr.reward = userr.reward - 10;
                                            }
                                          });
                                        }),
                                    Text(
                                      "Bank&Finance",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                              Text('${userr.bankvoucher}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
