import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String rechargeType;
String talktime;
String dataPlan;
String dataPlanTime;
String messages;
String validity;
String validityTime;
var viewPlansflag = false;

class BottomCards extends StatefulWidget {
  final String _rechargeType;
  final String _talktime;
  final String _dataPlan;
  final String _dataPlanTime;
  final String _messages;
  final String _validity;
  final String _validityTime;
  BottomCards(this._rechargeType, this._talktime, this._dataPlan,
      this._dataPlanTime, this._messages, this._validity, this._validityTime);
  @override
  _BottomCardsState createState() => _BottomCardsState();
}

class _BottomCardsState extends State<BottomCards> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            rechargeType = widget._rechargeType;
            talktime = widget._talktime;
            dataPlan = widget._dataPlan;
            dataPlanTime = widget._dataPlanTime;
            messages = widget._messages;
            validity = widget._validity;
            validityTime = widget._validityTime;
            viewPlansflag = true;
            Navigator.pop(context);
          },
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                  right: 8.0,
                                ),
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(
                                            width: 1.0, color: Colors.black))),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Talktime:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text("${widget._talktime} mintues"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                  right: 8.0,
                                ),
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(
                                            width: 1.0, color: Colors.black))),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Data Plan:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                        "${widget._dataPlan} ${widget._dataPlanTime}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                  right: 8.0,
                                ),
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(
                                            width: 1.0, color: Colors.black))),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Messages: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text("${widget._messages} messages"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Validity: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                  "${widget._validity} ${widget._validityTime}"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  new ButtonBar(
                    children: <Widget>[
                      new IconButton(
                        icon: Icon(Icons.help_outline), onPressed: () {},
                        //onPressed: COPY,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
