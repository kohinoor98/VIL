import 'package:VIL/pages/Authenticate/register.dart';
import 'package:VIL/pages/Authenticate/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool IsSighn = true;

  void toggleView()
  {
    setState(() {
      IsSighn=!IsSighn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(IsSighn==true)
    {
      return Container(
        child: SignIn(toggleView: toggleView),
      );
    }
    else
      {
        return Container(

          child: Register(toggleView: toggleView),
        );
      }
  }
}
