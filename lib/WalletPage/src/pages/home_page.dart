import 'package:VIL/WalletPage/src/models/user_model.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../utils/screen_size.dart';
import '../widgets/user_card.dart';
import 'package:VIL/Game/quizpage.dart';

List<UserModel> userCards;
int reward = 0;

class LeaderBoard extends StatefulWidget {
  // void getData() async {
  //   userCards = [];
  //   databaseReference
  //       .collection("LeaderBoard")
  //       .getDocuments()
  //       .then((QuerySnapshot snapshot) {
  //     snapshot.documents.forEach((f) async {
  //       userCards.add(UserModel(f.data['Name'],
  //           "assets/WalletImages/users/anna.jpeg", f.data['Score']));
  //       print("cc");
  //     });
  //     return userCards;
  //   });
  // }

  LeaderBoard(String s) {
    userid = s;
    // getData();
    // print(userCards.length);
    print("\n\n\n\n\n\n\n\n");
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
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 20,
                        ),
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
                        itemCount: getMovieCard().length,
                        itemBuilder: (BuildContext context, int index) {
                          
                          return Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: UserCardWidget(
                              user: getMovieCard()[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
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
                        itemCount: getMusicCard().length,
                        itemBuilder: (BuildContext context, int index) {
                       
                          return GestureDetector(
                            onTap: () {
                              print(getMusicCard()[index]);
                              print(index);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: UserCardWidget(
                                user: getMusicCard()[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
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
                        itemCount: getNewsCard().length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: UserCardWidget(
                              user: getNewsCard()[index],
                            ),
                          );
                        },
                      ),
                    ),
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
