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
  final AuthServices _auth  = AuthServices();
  String PhoneNumber = '';
  String Passowrd = '';
  String  error = '';
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0.0,
        title: Text("Sign In To VIL"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Register"),
            onPressed: ()
            {
              widget.toggleView();
            },
          )
        ],
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 155.0,
                child: Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter The Email':null,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Email",
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                 onChanged: (val)
                {
                          setState(() {
                              PhoneNumber = val;
                          });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.length < 6 ? 'Enter The long Password':null,
                obscureText: true,

                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Password",
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                onChanged: (val)
                {
                        setState(() {
                              Passowrd = val;
                        });
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                elevation: 5.0,

                  child: Text("Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                color: Colors.yellow,
                onPressed: () async
                {
                  if(formkey.currentState.validate())
                  {
                    dynamic result =   await _auth.SignInphone(PhoneNumber, Passowrd);
                    if(result == null)
                    {
                      setState(() {
                        error = 'Not Registered';
                      });
                    }

                  }
                },
              ),
              SizedBox(height: 20.0),
              Text(
                error,
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        )
      ),
    );
  }
}
