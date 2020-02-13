import 'package:VIL/pages/RechargePage/RechargeCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';

const gradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight, // 10% of the width, so there are ten blinds.
  colors: [const Color(0xFF1A1F36), const Color(0xFF41959C)], // whitish to gray
  tileMode: TileMode.repeated, // repeats the gradient over the canvas
);

const double topBarHeight = 150;
const double overlayHeight = 120;

class RechargePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recharge'),
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
      body: RechargeWalletPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class RechargeWalletPage extends StatefulWidget {
  RechargeWalletPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RechargeWalletPageState createState() => _RechargeWalletPageState();
}

class _RechargeWalletPageState extends State<RechargeWalletPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _tabLengthController = 4;

    return DefaultTabController(
      length: _tabLengthController,
      child: Scaffold(
        body: Stack(children: [
          // _Header(),
          // _CardEntry(),
          _TabView(),
        ]),
      ),
    );
  }
}

class _TabView extends StatelessWidget {
  const _TabView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 1))),
            child: TabBar(
              // indicator: ColorTabIndicator(Colors.blue),
              labelColor: Colors.black,
              isScrollable: true,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.black,
              indicatorWeight: 2,
              tabs: <Widget>[
                _tab('Special Recharge'),
                _tab('Talktime'),
                _tab('Data Plans'),
                _tab('Messages'),
              ],
            ),
          ),
          Expanded(
              //chnage this everytime you add or remove a tab
              child: TabBarView(children: [
            //tab 1
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  BottomCards("Special Recharge", "INF", "50", "GB per day",
                      "100", "28", "days"),
                  BottomCards("Special Recharge", "INF", "50", "GB per day",
                      "100", "28", "days"),
                  BottomCards("Special Recharge", "INF", "50", "GB per day",
                      "100", "28", "days"),
                  BottomCards("Special Recharge", "INF", "50", "GB per day",
                      "100", "28", "days"),
                  BottomCards("Special Recharge", "INF", "50", "GB per day",
                      "100", "28", "days"),
                  BottomCards("Special Recharge", "INF", "50", "GB per day",
                      "100", "28", "days"),
                  BottomCards("Special Recharge", "INF", "50", "GB per day",
                      "100", "28", "days"),
                  BottomCards("Special Recharge", "INF", "50", "GB per day",
                      "100", "28", "days"),

                  // BottomCards("cardTitle: ", "Hii"),
                  // BottomCards("cardTitle: ", "Hii"),
                  // BottomCards("cardTitle: ", "Hii"),
                  // BottomCards("cardTitle: ", "Hii"),
                  // BottomCards("cardTitle: ", "Hii"),
                  // BottomCards("cardTitle: ", "Hii"),
                  // BottomCards("cardTitle: ", "Hii"),
                ],
              ),
            ),
            //tab 2
            Container(child: Text('Talktime')),
            //tab 3
            Container(child: Text('Data plans')),
            //tab 4
            Container(child: Text('Messages')),
          ]))
        ]);
  }

  Widget _tab(text) {
    return Tab(
      child: Text(text,
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              // fontWeight: FontWeight.w100,
              letterSpacing: 2)),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 15.0,
      ),
      Container(
        padding: EdgeInsets.only(top: 40),
        alignment: AlignmentDirectional(0.0, -1.0),
        child: Text(
          'RECHARGE',
          style: TextStyle(
              fontWeight: FontWeight.w100,
              color: Colors.white,
              letterSpacing: 1,
              fontSize: 18),
        ),
        constraints: BoxConstraints(maxHeight: topBarHeight),
        decoration: BoxDecoration(
          gradient: gradient,
        ),
      ),
      Expanded(child: Text(''))
    ]);
  }
}

class _CardEntry extends StatelessWidget {
  const _CardEntry({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          10.0, topBarHeight - overlayHeight / 2, 10, 0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(4, 4),
              color: Color(0x33000000))
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                  alignment: AlignmentDirectional(-1, 0.0),
                  constraints: BoxConstraints(maxHeight: 50),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Enter the card number...',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          letterSpacing: 1),
                    ),
                  ),
                  color: Color(0x44FFFFFF)),
            ),
            constraints:
                BoxConstraints(maxWidth: 400, maxHeight: overlayHeight),
            decoration: BoxDecoration(
              gradient: gradient,
            ),
          ),
        ),
      ),
    );
  }
}
