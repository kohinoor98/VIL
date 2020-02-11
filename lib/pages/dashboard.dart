import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void init() {}

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
                const Color(0xFFFFFF45),
                const Color(0xFFFF5858),

                // const Color(0xFF00c3ff),
                // const Color(0xFFffff1c),
              ])),
        ),
      ),
      // debugShowCheckedModeBanner: false,
      // theme: ThemeData(fontFamily: 'Quicksand'),
      body: Container(
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
                  color: Colors.yellowAccent,
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
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Text(
                      'INR 100',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 25.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      color: Colors.grey,
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
          const Color(0xFFFFDD00),
          const Color(0xFFFBB034),
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
