import 'package:VIL/Services/auth.dart';
import 'package:VIL/Services/model/user.dart';
import 'package:VIL/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthServices().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VIL',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Wrapper(),
      ),
    );
  }
}
