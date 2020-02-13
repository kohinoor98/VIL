import 'package:VIL/Services/auth.dart';
import 'package:VIL/pages/Dashboard/CardPage/Views/MyCardsPage.dart';
import 'package:VIL/pages/Dashboard/RechargeButtonAnimation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController rechargeController = new TextEditingController();

  static final List<String> imgList = [
    // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    // 'https://www.mbaskool.com/2017_images/stories/mar-images/mktgmx-idea.jpg',

    'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201911/idea-vodafone-Social-770x433.jpeg?47hbsmaxuvIGkPVZMTfwsBqChEpNqfvW',
    'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201809/Vodafone_Idea.jpeg?qItV6l5p8yWbPhYNFXJFGW.O8Vafw5oU',
    'https://3.bp.blogspot.com/-Q_PqBvxHAkk/WEF39daU_OI/AAAAAAAAHOs/nCH48KkPLgMyF0ugy-mIIDUzmOfgQ_NCwCLcB/s320/Vodafone%2BGhana%2Bvoice%2Bpromotions.png',
    // 'https://companies.naukri.com/idea-jobs/wp-content/uploads/sites/241/2014/02/slide1.jpg',
    'https://image.slidesharecdn.com/ideavodamergerfinal19jan18-180318153951/95/idea-voda-merger-final-1-638.jpg?cb=1521387655',
    'https://www.menosfios.com/wp-content/uploads/2017/04/0180_OpenGraph_Homepage.png',
  ];

//Auto playing carousel
  final CarouselSlider autoPlayDemo = CarouselSlider(
    viewportFraction: 0.9,
    aspectRatio: 2.0,
    autoPlay: true,
    enlargeCenterPage: true,
    items: imgList.map(
      (url) {
        return Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              width: 1000.0,
            ),
          ),
        );
      },
    ).toList(),
  );

  void init() {}
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vodafone Idea Limited'),
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
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signout();
              },
              icon: Icon(Icons.person),
              label: Text("LogOut"))
        ],
      ),
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
                    Row(
                      children: <Widget>[
                        // Expanded(
                        //   child: Text(
                        //     "Idea Limited",
                        //     style: TextStyle(
                        //       fontFamily: 'Quicksand',
                        //       fontSize: 20.0,
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.normal,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE459),
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
                            'INR 100',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
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
                    SizedBox(height: 15.0),
                    Text(
                      'Wallet ID: 321-123-000',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.normal,
                          fontSize: 20.0,
                          color: Colors.white),
                    ),
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
                              '2100',
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50.0,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              'Next Recharge',
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20.0,
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
                                    '16 GB',
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
            SizedBox(
              height: 15.0,
            ),

            //recharge button flutter
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100.0,
                  child: TextFormField(
                    //get the input from rechargeController.text
                    controller: rechargeController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      // border: InputBorder.none,
                      hintText: 'Amount(₹)',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(width: 15.0),
                ButtonAnimation(Color(0xFFEF0201), Colors.red),
              ],
            ),

            Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Column(children: [
                  // Text('Auto Playing Carousel'),
                  autoPlayDemo,
                ])),
          ],
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
          const Color(0xFFEF0201),
          const Color(0xFFEF0201),
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

    path.lineTo(0.0, size.height - 40);

    var firstControlPoint = Offset(size.width * 0.02, size.height - 100);
    var firstEndPoint = Offset(size.width / 2, size.height - 25);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.98, size.height);
    var secondEndPoint = Offset(size.width, size.height - 80.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
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
