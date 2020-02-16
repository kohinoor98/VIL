import 'package:VIL/Game/rewardredemption.dart';
import 'package:VIL/Services/auth.dart';
import 'package:VIL/Services/model/UserData.dart';
import 'package:VIL/WalletPage/src/data/data.dart';
import 'package:VIL/WalletPage/src/pages/home_page.dart';
import 'package:VIL/WalletPage/src/utils/screen_size.dart';
import 'package:VIL/WalletPage/src/widgets/user_card.dart';
import 'package:VIL/pages/Dashboard/CardPage/Views/MyCardsPage.dart';
import 'package:VIL/pages/Dashboard/rechargeForm.dart';
import 'package:VIL/pages/RechargePage/RechargeMain.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Services/model/user.dart';
import 'package:provider/provider.dart';

UserData userr = new UserData();
AuthServices _auth = AuthServices();
String ss;

class Dashboard extends StatefulWidget {
  String userid;
  Dashboard(String u) {
    this.userid = u;
    ss = u;
  }
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController rechargeController = new TextEditingController();
  final AuthServices _authen = new AuthServices();
  String myText = "";

  void start() {
    DocumentReference documentReference =
        Firestore.instance.document("myData/" + widget.userid);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          userr.userId = datasnapshot.data['UserID'];
          userr.firstName = datasnapshot.data['FirstName'];
          userr.lastName = datasnapshot.data['LastName'];
          userr.email = datasnapshot.data['Email'];
          userr.reward = datasnapshot.data['Reward'];
          userr.data = datasnapshot.data['DataBalance'];
          userr.cash = datasnapshot.data['Cash'];
          userr.talk = datasnapshot.data['Talktime'];
          userr.LPRvoucher = datasnapshot.data['LPG Voucher'];
          userr.foodvoucher = datasnapshot.data['Food Voucher'];
          userr.healthvoucher = datasnapshot.data['HealthCare Voucher'];
          userr.showvoucher = datasnapshot.data['Shopping Voucher'];
          userr.travelvoucher = datasnapshot.data['Travel Voucher'];
          userr.workingvoucher =
              datasnapshot.data['Working and Productive Voucher'];
          userr.nwevoucher = datasnapshot.data['NWE Voucher'];
          userr.bankvoucher = datasnapshot.data['Banking Voucher'];
        });
      }
    });
  }

  static final List<String> imgList = [
    // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    // 'https://www.mbaskool.com/2017_images/stories/mar-images/mktgmx-idea.jpg',

    // 'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201911/idea-vodafone-Social-770x433.jpeg?47hbsmaxuvIGkPVZMTfwsBqChEpNqfvW',
    // 'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201809/Vodafone_Idea.jpeg?qItV6l5p8yWbPhYNFXJFGW.O8Vafw5oU',
    // 'https://3.bp.blogspot.com/-Q_PqBvxHAkk/WEF39daU_OI/AAAAAAAAHOs/nCH48KkPLgMyF0ugy-mIIDUzmOfgQ_NCwCLcB/s320/Vodafone%2BGhana%2Bvoice%2Bpromotions.png',
    // // 'https://companies.naukri.com/idea-jobs/wp-content/uploads/sites/241/2014/02/slide1.jpg',
    // 'https://image.slidesharecdn.com/ideavodamergerfinal19jan18-180318153951/95/idea-voda-merger-final-1-638.jpg?cb=1521387655',
    // 'https://www.menosfios.com/wp-content/uploads/2017/04/0180_OpenGraph_Homepage.png',

    //lifestyle:
    'https://cdn.shopify.com/s/files/1/0196/5170/files/Jaguar-i-pace-advert_grande.png',
    //shopping:
    'https://secureservercdn.net/198.71.233.47/tvu.d1e.myftpupload.com/wp-content/uploads/2018/12/lifestyle-preview-sale-gt-upto-50-off-ad-times-of-india-delhi-16-12-2018.png?time=1579717076',
    //food:
    'https://i1.wp.com/cdn.inc42.com/wp-content/uploads/2019/12/box-8-feature.jpg?fit=1360%2C1020&ssl=1&resize=1360%2C1020',
    //healthcare:
    'https://s.yimg.com/ny/api/res/1.2/wEnQAojds9vLe8dtrdZmMA--~A/YXBwaWQ9aGlnaGxhbmRlcjtzbT0xO3c9ODAw/http://media.zenfs.com/en-IN/homerun/yahooindianewsroom.com/19291e2b6d7c0a12fbfbff77a8818654',
    //travel:
    'https://i.pinimg.com/originals/dc/2d/4b/dc2d4b0c9c5e4d3051c276c7f8ac7852.jpg',
    //banking:
    'https://www.adgully.com/img/800/201807/icici_app_2.jpg',
    //vodafone:
    'https://www.telecommirror.com/wp-content/uploads/2018/01/pug-Cheeka.jpg',
    //news:
    'https://5.imimg.com/data5/CH/SQ/MY-58746495/newspaper-advertisement-service-500x500.png',
    //entertainment:
    'https://d.ibtimes.co.uk/en/full/1427140/amazon-prime-free-trial-adverts-banned.jpg?w=600&e=53e45fe1e6a1bb3d938e425b6e86efc8',
  ];

//Auto playing carousel
  final CarouselSlider autoPlayDemo = CarouselSlider(
    viewportFraction: 0.9,
    aspectRatio: 2.0,
    autoPlay: true,
    enlargeCenterPage: true,
    items: imgList.map(
      (url) {
        return GestureDetector(
          onTap: () {
            print("\n\n\n\n\n$url\n\n\n\n");
            if (url == imgList[0]) {
              _auth.updateSpyder(ss, "LPG Spyder", 0.4);
            } else if (url == imgList[1]) {
              print('shopping');
              _auth.updateSpyder(ss, "Shopping Spyder", 0.4);
            } else if (url == imgList[2]) {
              print('food');
              _auth.updateSpyder(ss, "Food Spyder", 0.4);
            } else if (url == imgList[3]) {
              print('healthcare');
              _auth.updateSpyder(ss, "HealthCare Spyder", 0.4);
            } else if (url == imgList[4]) {
              print('travel');
              _auth.updateSpyder(ss, "Travel Spyder", 0.4);
            } else if (url == imgList[5]) {
              print('banking');
              _auth.updateSpyder(ss, "Banking Spyder", 0.4);
            } else if (url == imgList[6]) {
              print('vodafone');
              // _auth.updateSpyder(ss, "LPG Spyder", 0.4);
            } else if (url == imgList[7]) {
              print('news');
              _auth.updateSpyder(ss, "NWE Spyder", 0.4);
            } else if (url == imgList[8]) {
              print('entertainment');
              _auth.updateSpyder(ss, "NWE Spyder", 0.4);
            }
            print('\n\n\n\n');
          },
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
          ),
        );
      },
    ).toList(),
  );

  void init() {}

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    final user = Provider.of<User>(context);

    print(user.uid);
    start();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Vodafone Idea Limited',
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
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signout();
                },
                icon: Icon(Icons.person),
                label: Text("LogOut"))
          ],
        ),
        //form page
        // floatingActionButton: Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: <Widget>[
        //     SizedBox(width: 30.0),
        //     FloatingActionButton(
        //       heroTag: "fab_form",
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => FormFill()));
        //       },
        //       child: Icon(Icons.add),
        //     ),
        //   ],
        // ),
        // debugShowCheckedModeBanner: false,
        // theme: ThemeData(fontFamily: 'Quicksand'),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                child: Stack(children: <Widget>[
                  CustomMadeClipper(),
                  Positioned(
                    top: 25.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                        child: Column(children: <Widget>[
                      // Row(
                      //   children: <Widget>[
                      //     // Expanded(
                      //     //   child: Text(
                      //     //     "Idea Limited",
                      //     //     style: TextStyle(
                      //     //       fontFamily: 'Quicksand',
                      //     //       fontSize: 20.0,
                      //     //       color: Colors.white,
                      //     //       fontWeight: FontWeight.normal,
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                'Balance',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 25.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Text(
                              'INR ${userr.cash}',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 25.0,
                                color: Color(0xFFE00201),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // _auth.updatecategory("Banking", widget.userid,10);
                                print(AuthServices().user);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyCardsPage()),
                                );
                              },
                              color: Colors.black,
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 15.0),
                      // Text(
                      //   'Wallet ID: 321-123-000',
                      //   style: TextStyle(
                      //       fontFamily: 'Quicksand',
                      //       fontWeight: FontWeight.normal,
                      //       fontSize: 20.0,
                      //       color: Colors.white),
                      // ),
                      SizedBox(height: 35.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // SizedBox(width: 20.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Reward Points',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Text(
                                '${userr.reward}',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Next Recharge',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Text(
                                '12 days',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 50.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 110.0,
                            height: 150.0,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      '${userr.data}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors.black),
                                    ),
                                    SizedBox(height: 15.0),
                                    Text(
                                      'Data Left',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20.0,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 110.0,
                            height: 150.0,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      '${userr.talk}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors.black),
                                    ),
                                    SizedBox(height: 15.0),
                                    Text(
                                      'Call',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20.0,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 110.0,
                            height: 150.0,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      '∞',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors.black),
                                    ),
                                    SizedBox(height: 15.0),
                                    Text(
                                      'Message',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 19.0,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ])),
                  ),
                ]),
              ),
              //recharge button flutter
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // viewPlansflag
                    //     ? {

                    Container(
                        // width: 200.0,
                        height: 50.0,
                        child: FlatButton(
                            color: Color(0xFFE00201),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RewardRedemptionPage(userr),
                                  // RechargePage(this.userId)
                                ),
                              );
                            },
                            child: Text(
                              "Redeem Rewards",
                              // "View Plans",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ))),
                    SizedBox(width: 30.0),
                    // ButtonAnimation(
                    //     Color(0xFFF50201), Colors.red, widget.userid),
                    //   }
                    // : {
                    //     Text("data"),
                    //   }
                    Container(
                        // width: 200.0,
                        height: 50.0,
                        child: FlatButton(
                            color: Color(0xFFE00201),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      // LeaderBoard(userr.userId),
                                  RechargePage(userr.userId)
                                ),
                              );
                            },
                            child: Text(
                              "View Plans",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ))),
                  ],
                ),
              ),

              Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(children: [
                    // Text('Auto Playing Carousel'),
                    autoPlayDemo,
                  ])),
              // SizedBox(height: 15.0),

              // SizedBox(
              //   height: 200.0,
              //   child: ListView(
              //     padding: EdgeInsets.zero,
              //     // physics: BouncingScrollPhysics(),
              //     children: <Widget>[
              //       Container(
              //         color: Colors.grey.shade50,
              //         width: _media.width,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             Padding(
              //               padding: const EdgeInsets.only(
              //                   left: 25.0, right: 10, bottom: 20, top: 20),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: <Widget>[
              //                   Text(
              //                     "Movies",
              //                     style: TextStyle(
              //                       fontSize: 17,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                   Icon(
              //                     Icons.arrow_forward_ios,
              //                     color: Colors.grey,
              //                     size: 20,
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Container(
              //               margin: EdgeInsets.only(left: 25),
              //               height: screenAwareSize(
              //                   _media.longestSide <= 775 ? 110 : 80, context),
              //               child: NotificationListener<
              //                   OverscrollIndicatorNotification>(
              //                 onNotification: (overscroll) {
              //                   overscroll.disallowGlow();
              //                 },
              //                 child: ListView.builder(
              //                   physics: BouncingScrollPhysics(),
              //                   scrollDirection: Axis.horizontal,
              //                   itemCount: getMovieCard().length,
              //                   itemBuilder: (BuildContext context, int index) {
              //                     return Padding(
              //                       padding: EdgeInsets.only(right: 20),
              //                       child: UserCardWidget(
              //                         user: getMovieCard()[index],
              //                       ),
              //                     );
              //                   },
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 25.0,
              //             ),
              //             Container(
              //               margin: EdgeInsets.only(left: 25),
              //               height: screenAwareSize(
              //                   _media.longestSide <= 775 ? 110 : 80, context),
              //               child: NotificationListener<
              //                   OverscrollIndicatorNotification>(
              //                 onNotification: (overscroll) {
              //                   overscroll.disallowGlow();
              //                 },
              //                 child: ListView.builder(
              //                   physics: BouncingScrollPhysics(),
              //                   scrollDirection: Axis.horizontal,
              //                   itemCount: getMusicCard().length,
              //                   itemBuilder: (BuildContext context, int index) {
              //                     return GestureDetector(
              //                       onTap: () {
              //                         print(getMusicCard()[index]);
              //                         print(index);
              //                       },
              //                       child: Padding(
              //                         padding: EdgeInsets.only(right: 20),
              //                         child: UserCardWidget(
              //                           user: getMusicCard()[index],
              //                         ),
              //                       ),
              //                     );
              //                   },
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 25.0,
              //             ),
              //             Container(
              //               margin: EdgeInsets.only(left: 25),
              //               height: screenAwareSize(
              //                   _media.longestSide <= 775 ? 110 : 80, context),
              //               child: NotificationListener<
              //                   OverscrollIndicatorNotification>(
              //                 onNotification: (overscroll) {
              //                   overscroll.disallowGlow();
              //                 },
              //                 child: ListView.builder(
              //                   physics: BouncingScrollPhysics(),
              //                   scrollDirection: Axis.horizontal,
              //                   itemCount: getNewsCard().length,
              //                   itemBuilder: (BuildContext context, int index) {
              //                     return Padding(
              //                       padding: EdgeInsets.only(right: 20),
              //                       child: UserCardWidget(
              //                         user: getNewsCard()[index],
              //                       ),
              //                     );
              //                   },
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomMadeClipper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        height: 380,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          // const Color(0xFFF50201),
          // const Color(0xFFF50201),
          Color(0xFFE00201), Color(0xFFE00201)
        ])),
      ),
      clipper: CustomBlueClipper(),
    );
  }
}

class CustomBlueClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 70);

    var firstControlPoint = Offset(size.width * 0.02, size.height - 140);
    var firstEndPoint = Offset(size.width / 2, size.height - 70);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.98, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 120.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 70);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  bool shouldReclip(CustomClipper<Path> oldCipper) {
    return false;
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
