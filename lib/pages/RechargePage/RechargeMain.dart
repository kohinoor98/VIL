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

class RechargePage extends StatelessWidget {
  String userid;
  RechargePage(String us)
  {
    this.userid = us;
  }
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
        body: _TabView(),
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
              indicatorWeight: 1,
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
                  BottomCards("Special Recharge", "INF", "50", "GB per day",
                      "100", "28", "days"),
                  BottomCards("Special Recharge", "INF", "50", "GB per day",
                      "100", "28", "days"),
                  BottomCards("Special Recharge", "INF", "50", "GB per day",
                      "100", "28", "days"),
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
