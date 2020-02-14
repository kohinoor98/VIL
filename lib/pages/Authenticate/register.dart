import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:VIL/Services/auth.dart';

final AuthServices _auth = AuthServices();
String email = '';
String phoneNumber = '';
String passoword1 = '';
String fName = '';
String lName = '';
// String error = '';
final _formkey = GlobalKey<FormState>();
final TextEditingController _controller =
    new TextEditingController(); //controller for re enter password
final TextEditingController _passcontroller =
    new TextEditingController(); //controller to get password
final TextEditingController phoneNumberController =
    new TextEditingController(); //controller for phone number

var assetsImage = new AssetImage('assets/VILL.png');

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    var alert = new CupertinoAlertDialog(
      title: new Text("Alert"),
      content: new Text("Invalid Email-Id or Password"),
      actions: <Widget>[
        new CupertinoDialogAction(
            child: const Text('OK'),
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context, 'OK');
            }),
      ],
    );

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: // MessagingWidget(),
          SingleChildScrollView(
            child: Form(
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
                        // keyboardType: TextInputType.emailAddress,
                        // validator: (val) =>
                        //     val.isEmpty ? 'Enter The Email' : null,
                        textCapitalization: TextCapitalization.words,

                        onChanged: (val) {
                          setState(() {
                            fName = val;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: 'FIRST NAME',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0Xff357DED)))),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        // keyboardType: TextInputType.emailAddress,
                        // validator: (val) =>
                        //     val.isEmpty ? 'Enter The Email' : null,
                        keyboardType: TextInputType.emailAddress,

                        onChanged: (val) {
                          setState(() {
                            lName = val;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: 'LAST NAME',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0Xff357DED)))),
                      ),
                      TextFormField(

                        // keyboardType: TextInputType.emailAddress,
                        // validator: (val) =>
                        //     val.isEmpty ? 'Enter The Email' : null,
                        keyboardType: TextInputType.phone,
                        validator: validatePhoneNumber, //Email validation
                        onChanged: (val) {
                          setState(() {
                            phoneNumber = val;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: 'PHONE NUMBER',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0Xff357DED)))),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        // keyboardType: TextInputType.emailAddress,
                        // validator: (val) =>
                        //     val.isEmpty ? 'Enter The Email' : null,
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail, //Email validation
                        onChanged: (val) {
                          setState(() {
                            email = val;
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
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _passcontroller,
                        obscureText: true,
                        // validator: (val) =>
                        //     val.length < 6 ? 'Enter The long Password' : null,
                        validator: (value) => //Password validation
                            value.isEmpty ? 'Password cannot be empty' : null,
                        onChanged: (val) {
                          setState(() {
                            passoword1 = val;
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
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _controller,
                        validator:
                            _validatePassword, //Re enter password validation
                        decoration: InputDecoration(
                            labelText: 'RE-ENTER PASSWORD ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff357DED)))),
                        obscureText: true,
                      ),
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
                              dynamic result = await _auth.registerPhone(
                                  //register phone function
                                  email,
                                  passoword1,
                                  phoneNumber);
                              if (result == null) {
                                showDialog(context: context, child: alert);
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
                                'Register',
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
                    'Already have the Account?',
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      widget.toggleView();
                    },
                    child: Text(
                      'SignIn',
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
          ),
    );
  }

  String _validatePassword(String value) {
    print(passoword1);
    if (value.isEmpty) {
      return 'Password can\'t be empty';
    } else if (value.length < 6) {
      _controller.clear();
      return 'Password\'s length should be greater than 6';
    } else if (value == _passcontroller.text) {
      return null;
    } else {
      _controller.clear();
      print(_passcontroller.text);
      print(value);

      return 'Passwords do not not match';
    }
  }

  String validateEmail(String value) {
    // Pattern pattern =
    //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    String pattern = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePhoneNumber(String value) {
    // Pattern pattern =
    //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    String pattern = "[0-9]{10}";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value.length > 10)
      return 'Enter Valid Phone Number';
    else
      return null;
  }
}
