import 'package:VIL/Services/auth.dart';
import 'package:VIL/pages/Authenticate/register.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();
  String PhoneNumber = '';
  String Passowrd = '';
  String error = '';
  final _formkey = GlobalKey<FormState>();
  var assetsImage = new AssetImage('assets/VILL.png');
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: // MessagingWidget(),
          Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 125.0, 0.0, 0.0),
                    child: Text("Vodafone",
                        style: TextStyle(
                            fontSize: 35.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('Idea',
                        style: TextStyle(
                            fontSize: 35.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 225.0, 0.0, 0.0),
                    child: Text('Limited',
                        style: TextStyle(
                            fontSize: 35.0, fontWeight: FontWeight.bold)),
                  ),
                  Positioned(
                    right: 10.0,
                    bottom: -20.0,
                    child: Container(
                      // decoration: new BoxDecoration(
                      //   color: Colors.white70,
                      // ),
                      child: Image(
                        image: assetsImage,
                        width: 175.0,
                        height: 175.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) =>
                          val.isEmpty ? 'Enter The Email' : null,
                      onChanged: (val) {
                        setState(() {
                          PhoneNumber = val;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0Xff357DED)))),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      obscureText: true,
                      validator: (val) =>
                          val.length < 6 ? 'Enter The long Password' : null,
                      onChanged: (val) {
                        setState(() {
                          Passowrd = val;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0XFF357DED)))),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        //onTap: sendResetEmail,
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0XFF1DC5A3),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 50.0,
                      child: GestureDetector(
                        onTap: () async {
                          if (_formkey.currentState.validate()) {
                            dynamic result =
                                await _auth.SignInphone(PhoneNumber, Passowrd);
                            if (result == null) {
                              setState(() {
                                error = 'Not Registered';
                              });
                            }
                          }
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          shadowColor: Color(0Xff357DED),
                          color: Color(0xFF357DED),
                          elevation: 7.0,
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Not Yet Registered?',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    widget.toggleView();
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Color(0XFF1DC5A3),
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
