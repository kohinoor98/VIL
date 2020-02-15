import 'package:VIL/Services/auth.dart';
import 'package:VIL/pages/Authenticate/autthentication.dart';
import 'package:flutter/material.dart';
import '../utils/screen_size.dart';
import '../widgets/donut_charts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../widgets/percent_indicator.dart';
import '../widgets/wave_progress.dart';
import 'package:VIL/Services/model/UserData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


var data = [
  new DataPerItem('Home', 35, Colors.greenAccent),
  new DataPerItem('Food & Drink', 25, Colors.yellow),
  new DataPerItem('Hotel & Restaurant', 24, Colors.indigo),
  new DataPerItem('Travelling', 40, Colors.pinkAccent),
];

var series = [
  new charts.Series(
    domainFn: (DataPerItem clickData, _) => clickData.name,
    measureFn: (DataPerItem clickData, _) => clickData.percent,
    colorFn: (DataPerItem clickData, _) => clickData.color,
    id: 'Item',
    data: data,
  ),
];

AuthServices _auth = AuthServices();
UserData userr = new UserData();
String ss;
double LPG = 0.0;
double HC = 0.0;
double F = 0.0;
double NWE = 0.0;
double B = 0.0;
double WP = 0.0;
double T = 0.0;
double S = 0.0;


class OverviewPage extends StatefulWidget {
  String userid;
  OverviewPage(String u) {
    this.userid = u;
    ss = u;
  }
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {

  var data_used_percent = 68.0;

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
          LPG = datasnapshot.data['LPG Spyder'];
          F = datasnapshot.data['Food Spyder'];
          HC = datasnapshot.data['HealthCare Spyder'];
          S = datasnapshot.data['Shopping Spyder'];
          T = datasnapshot.data['Travel Spyder'];
          WP = datasnapshot.data['Working and Productive Spyder'];
          NWE = datasnapshot.data['NWE Spyder'];
          B = datasnapshot.data['Banking Spyder'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _auth.start(widget.userid);
    start();
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Spyder Customer Analysis'),
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
      body: ListView(
        // physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: 20,
          top: 0,
        ),
        children: <Widget>[

        /*
          Row(
            children: <Widget>[
              colorCard("Cash ${_auth.cash}", 35.170, 1, context, Color(0xFFFF4B28)),
              colorCard("Rewards Earned", 4320, 1, context, Colors.amber),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          // RichText(
          //   text: TextSpan(
          //     children: [
          //       TextSpan(
          //         text: "Spendings",
          //         style: TextStyle(
          //           color: Colors.black,
          //           fontSize: 24,
          //           fontWeight: FontWeight.bold,
          //           fontFamily: "Varela",
          //         ),
          //       ),
          //       TextSpan(
          //         text: "    July 2018",
          //         style: TextStyle(
          //           color: Colors.grey.shade400,
          //           fontWeight: FontWeight.w700,
          //           fontSize: 16,
          //           fontFamily: "Varela",
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.only(
          //     top: 15,
          //     right: 20,
          //   ),
          //   height:
          //       screenAwareSize(_media.longestSide <= 775 ? 180 : 130, context),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(6),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey.shade100,
          //         blurRadius: 6,
          //         spreadRadius: 10,
          //       )
          //     ],
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       Container(
          //         height: 180,
          //         width: 160,
          //         child: DonutPieChart(
          //           series,
          //           animate: true,
          //         ),
          //       ),
          //       Container(
          //         child: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: <Widget>[
          //             SizedBox(
          //               height: 15,
          //             ),
          //             donutCard(Colors.indigo, "Availiable"),
          //             donutCard(Colors.yellow, "Cash Availaible"),
          //             donutCard(Colors.greenAccent, "Rewards Earn"),
          //             donutCard(Colors.pinkAccent, "Recharged"),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),*/
          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "LifeStyle and Personal Growth",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Varela",
                  ),
                ),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 20,
            ),
            padding: EdgeInsets.all(10),
            height: screenAwareSize(45, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 6,
                  spreadRadius: 10,
                )
              ],
            ),
            child: LinearPercentIndicator(
              width: screenAwareSize(
                  MediaQuery.of(context).size.width*0.7,
                  // _media.width - (_media.longestSide <= 775 ? 100 : 160),
                  context),
              lineHeight: 20.0,
              percent: LPG/10,
              backgroundColor: Colors.grey.shade300,
              progressColor: Color(0xFFFF4B2B),
              animation: true,
              animateFromLastPercent: true,
              alignment: MainAxisAlignment.spaceEvenly,
              animationDuration: 1000,
              linearStrokeCap: LinearStrokeCap.roundAll,
              center: Text(
                "${LPG * 10} %",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 30),

          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Health Care",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Varela",
                  ),
                ),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 20,
            ),
            padding: EdgeInsets.all(10),
            height: screenAwareSize(45, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 6,
                  spreadRadius: 10,
                )
              ],
            ),
            child: LinearPercentIndicator(
              width: screenAwareSize(
                  MediaQuery.of(context).size.width*0.7,
                  // _media.width - (_media.longestSide <= 775 ? 100 : 160),
                  context),
              lineHeight: 20.0,
              percent: HC/10,
              backgroundColor: Colors.grey.shade300,
              progressColor: Color(0xFFFF4B2B),
              animation: true,
              animateFromLastPercent: true,
              alignment: MainAxisAlignment.spaceEvenly,
              animationDuration: 1000,
              linearStrokeCap: LinearStrokeCap.roundAll,
              center: Text(
                "${HC * 10} %",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Work And Productive",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Varela",
                  ),
                ),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 20,
            ),
            padding: EdgeInsets.all(10),
            height: screenAwareSize(45, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 6,
                  spreadRadius: 10,
                )
              ],
            ),
            child: LinearPercentIndicator(
              width: screenAwareSize(
                  MediaQuery.of(context).size.width*0.7,
                  // _media.width - (_media.longestSide <= 775 ? 100 : 160),
                  context),
              lineHeight: 20.0,
              percent: WP/10,
              backgroundColor: Colors.grey.shade300,
              progressColor: Color(0xFFFF4B2B),
              animation: true,
              animateFromLastPercent: true,
              alignment: MainAxisAlignment.spaceEvenly,
              animationDuration: 1000,
              linearStrokeCap: LinearStrokeCap.roundAll,
              center: Text(
                "${WP * 10} %",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 30),

          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Travel",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Varela",
                  ),
                ),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 20,
            ),
            padding: EdgeInsets.all(10),
            height: screenAwareSize(45, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 6,
                  spreadRadius: 10,
                )
              ],
            ),
            child: LinearPercentIndicator(
              width: screenAwareSize(
                  MediaQuery.of(context).size.width*0.7,
                  // _media.width - (_media.longestSide <= 775 ? 100 : 160),
                  context),
              lineHeight: 20.0,
              percent: T/10,
              backgroundColor: Colors.grey.shade300,
              progressColor: Color(0xFFFF4B2B),
              animation: true,
              animateFromLastPercent: true,
              alignment: MainAxisAlignment.spaceEvenly,
              animationDuration: 1000,
              linearStrokeCap: LinearStrokeCap.roundAll,
              center: Text(
                "${T * 10} %",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 30),

          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Shopping",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Varela",
                  ),
                ),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 20,
            ),
            padding: EdgeInsets.all(10),
            height: screenAwareSize(45, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 6,
                  spreadRadius: 10,
                )
              ],
            ),
            child: LinearPercentIndicator(
              width: screenAwareSize(
                  MediaQuery.of(context).size.width*0.7,
                  // _media.width - (_media.longestSide <= 775 ? 100 : 160),
                  context),
              lineHeight: 20.0,
              percent: S/10,
              backgroundColor: Colors.grey.shade300,
              progressColor: Color(0xFFFF4B2B),
              animation: true,
              animateFromLastPercent: true,
              alignment: MainAxisAlignment.spaceEvenly,
              animationDuration: 1000,
              linearStrokeCap: LinearStrokeCap.roundAll,
              center: Text(
                "${S * 10} %",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 30),

          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "News and Woring",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Varela",
                  ),
                ),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 20,
            ),
            padding: EdgeInsets.all(10),
            height: screenAwareSize(45, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 6,
                  spreadRadius: 10,
                )
              ],
            ),
            child: LinearPercentIndicator(
              width: screenAwareSize(
                  MediaQuery.of(context).size.width*0.7,
                  // _media.width - (_media.longestSide <= 775 ? 100 : 160),
                  context),
              lineHeight: 20.0,
              percent: NWE/10,
              backgroundColor: Colors.grey.shade300,
              progressColor: Color(0xFFFF4B2B),
              animation: true,
              animateFromLastPercent: true,
              alignment: MainAxisAlignment.spaceEvenly,
              animationDuration: 1000,
              linearStrokeCap: LinearStrokeCap.roundAll,
              center: Text(
                "${NWE * 10} %",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 30),

          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Food",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Varela",
                  ),
                ),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 20,
            ),
            padding: EdgeInsets.all(10),
            height: screenAwareSize(45, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 6,
                  spreadRadius: 10,
                )
              ],
            ),
            child: LinearPercentIndicator(
              width: screenAwareSize(
                  MediaQuery.of(context).size.width*0.7,
                  // _media.width - (_media.longestSide <= 775 ? 100 : 160),
                  context),
              lineHeight: 20.0,
              percent: F/10,
              backgroundColor: Colors.grey.shade300,
              progressColor: Color(0xFFFF4B2B),
              animation: true,
              animateFromLastPercent: true,
              alignment: MainAxisAlignment.spaceEvenly,
              animationDuration: 1000,
              linearStrokeCap: LinearStrokeCap.roundAll,
              center: Text(
                "${F * 10} %",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 30),

          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Banking",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Varela",
                  ),
                ),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 20,
            ),
            padding: EdgeInsets.all(10),
            height: screenAwareSize(45, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 6,
                  spreadRadius: 10,
                )
              ],
            ),
            child: LinearPercentIndicator(
              width: screenAwareSize(
                  MediaQuery.of(context).size.width*0.65,
                  // _media.width - (_media.longestSide <= 775 ? 100 : 160),
                  context),
              lineHeight: 20.0,
              percent: B/10,
              backgroundColor: Colors.grey.shade300,
              progressColor: Color(0xFFFF4B2B),
              animation: true,
              animateFromLastPercent: true,
              alignment: MainAxisAlignment.spaceEvenly,
              animationDuration: 1000,
              linearStrokeCap: LinearStrokeCap.roundAll,
              center: Text(
                "${B * 10} %",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 30),


          SizedBox(
            height: 30,
          ),
          Text(
            "History",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              inherit: true,
              letterSpacing: 0.4,
            ),
          ),
          vaweCard(
            context,
            "Cash Earned",
            200,
            1,
            Colors.grey.shade100,
            Colors.indigo,
          ),
          vaweCard(
            context,
            "Recharged",
            3210,
            -1,
            Colors.grey.shade100,
            Colors.pinkAccent,
          ),
        ],
      ),
    );
  }


  Widget vaweCard(BuildContext context, String name, double amount, int type,
      Color fillColor, Color bgColor) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        right: 20,
      ),
      padding: EdgeInsets.only(left: 15),
      height: screenAwareSize(80, context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 6,
            spreadRadius: 10,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              WaveProgress(
                screenAwareSize(45, context),
                fillColor,
                bgColor,
                67,
              ),
              Text(
                "80%",
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "${type > 0 ? "" : "-"} \$ ${amount.toString()}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget donutCard(Color color, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 0,
            top: 18,
            right: 10,
          ),
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            inherit: true,
          ),
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        )
      ],
    );
  }

  Widget colorCard(
      String text, double amount, int type, BuildContext context, Color color) {
    final _media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15),
      padding: EdgeInsets.all(15),
      height: screenAwareSize(90, context),
      width: _media.width / 2 - 25,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 16,
                spreadRadius: 0.2,
                offset: Offset(0, 8)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "${type > 0 ? "" : "-"} \$ ${amount.toString()}",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

