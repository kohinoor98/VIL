import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomCards extends StatefulWidget {
  final String rechargeType;
  final String talktime;
  final String dataPlan;
  final String dataPlanTime;
  final String messages;
  final String validity;
  final String validityTime;
  BottomCards(this.rechargeType, this.talktime, this.dataPlan,
      this.dataPlanTime, this.messages, this.validity, this.validityTime);
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
          onTap: () {},
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
                                    Text("${widget.talktime} mintues"),
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
                                        "${widget.dataPlan} ${widget.dataPlanTime}"),
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
                                    Text("${widget.messages} messages"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0,),
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
                              Text("${widget.validity} ${widget.validityTime}"),
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
