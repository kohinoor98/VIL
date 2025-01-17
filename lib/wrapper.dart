import 'package:VIL/Services/model/user.dart';
import 'package:VIL/pages/Authenticate/autthentication.dart';
import 'package:VIL/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if(user == null)
      {
        return Authenticate();
      }
    else
      {

        return Home(user.uid);
      }
  }
}
