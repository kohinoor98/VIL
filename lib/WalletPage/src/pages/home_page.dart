

import 'package:VIL/Services/auth.dart';
import 'package:VIL/WalletPage/src/models/user_model.dart';
import 'package:VIL/pages/Authenticate/autthentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../pages/overview_page.dart';
import '../utils/screen_size.dart';
import '../widgets/credit_card.dart';
import '../widgets/payment_card.dart';
import '../widgets/user_card.dart';
import 'package:VIL/Game/quizpage.dart';


List<UserModel> userCards;
int  reward = 0;

class LeaderBoard extends StatefulWidget {


  void getData() async
  {
    userCards = [];
    databaseReference
        .collection("LeaderBoard")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) async {userCards.add(UserModel(f.data['Name'],"assets/WalletImages/users/anna.jpeg",f.data['Score']));
      print("cc");} );
      return userCards;
    });

  }


  LeaderBoard(String s,AuthServices u)
  {
    userid = s;
    getData();
    userCards = u.userCards;
    print(userCards.length);
    print("\n\n\n\n\n\n\n\n");
    reward = u.reward;
  }

  // const LeaderBoard({Key key}) : super(key: key);
  @override
  _LeaderBoard createState() => _LeaderBoard();
}

class _LeaderBoard extends State<LeaderBoard> {


  @override
  Widget build(BuildContext context) {
    //_auth.start(widget.userid);


    final _media = MediaQuery.of(context).size;
    return MaterialApp(
      //no appbar
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Container(
              color: Colors.grey.shade50,
              height: _media.height / 2,
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Stack(
                          children: <Widget>[
                            Material(
                              elevation: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/leaderboard.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 0.3,
                              child: Container(
                                color: Colors.black87,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 20,
                      ),
                      height: _media.longestSide <= 775
                          ? _media.height / 4
                          : _media.height / 4.3,
                      width: _media.width,
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowGlow();
                        },
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.only(bottom: 10),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: getCreditCards().length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OverviewPage(""))),
                                child: CreditCard(
                                  card: getCreditCards()[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: _media.longestSide <= 775
                        ? screenAwareSize(20, context)
                        : screenAwareSize(35, context),
                    left: 10,
                    right: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.notifications_none,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () => print("notification"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Leader Board",
                                style: TextStyle(
                                    fontSize:
                                        _media.longestSide <= 775 ? 35 : 40,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Varela"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey.shade50,
              width: _media.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 10, bottom: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Top Players",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Icon(
                        //   Icons.arrow_forward_ios,
                        //   color: Colors.grey,
                        //   size: 20,
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    height: screenAwareSize(
                        _media.longestSide <= 775 ? 110 : 80, context),
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowGlow();
                      },
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: getUsersCard().length,
                        itemBuilder: (BuildContext context, int index) {
                          // if (index == 0) {
                          //   return Padding(
                          //       padding: EdgeInsets.only(right: 10),
                          //       child: AddButton());
                          // }

                          return Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: UserCardWidget(
                              user: getUsersCard()[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowGlow();
                        },
                        child: ListView.separated(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 85.0),
                              child: Divider(),
                            );
                          },
                          padding: EdgeInsets.zero,
                          itemCount: getLeaderBoardCard().length,
                          itemBuilder: (BuildContext context, int index) {
                            return PaymentCardWidget(
                              payment: getLeaderBoardCard()[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
