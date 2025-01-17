import 'package:VIL/Game/games.dart';
import 'package:VIL/pages/Dashboard/dashboard.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:VIL/Bot/bot_file.dart';
import 'package:VIL/WalletPage/src/pages/overview_page.dart';

class Home extends StatefulWidget {
  String userid;
  Home(String u) {
    this.userid = u;
  }
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Properties & Variables needed

  int currentPage = 0; // to keep track of active tab index
  // to store nested tabs
  GlobalKey bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: _getPage(currentPage),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "fab_home",
          child: Icon(Icons.live_help),
          elevation: 20.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IdeaChatBot()),
            );
          },
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: FancyBottomNavigation(
          // barBackgroundColor: Color(0xFFFF4B2B),
          barBackgroundColor: Colors.grey[200],
          activeIconColor: Color(0xFFE00201),
          circleColor: Colors.white,
          inactiveIconColor: Color(0xFFE00201),
          tabs: [
            TabData(
                iconData: Icons.home,
                title: "Home",
                // textColor: Color(0xFFE00201),
                onclick: () {
                  final FancyBottomNavigationState fState =
                      bottomNavigationKey.currentState;
                  fState.setPage(0);
                }),
            TabData(
                iconData: Icons.games,
                title: "Games",
                onclick: () {
                  final FancyBottomNavigationState fState =
                      bottomNavigationKey.currentState;
                  fState.setPage(1);
                }),
            TabData(
                iconData: Icons.account_balance_wallet,
                title: "Wallet",
                onclick: () {
                  final FancyBottomNavigationState fState =
                      bottomNavigationKey.currentState;
                  fState.setPage(2);
                })
          ],
          initialSelection: 0,
          key: bottomNavigationKey,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ));
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return Dashboard(widget.userid);
      case 1:
        return Games(widget.userid);
      case 2:
        return OverviewPage(widget.userid);

      default:
        return Dashboard(widget.userid);
    }
  }
}
