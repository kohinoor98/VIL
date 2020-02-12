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
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter The Email':null,
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
                onChanged: (val)
                {
                        setState(() {
                              Passowrd = val;
                        });
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.yellow,
                child: Text("SignIn"),
                onPressed: () async
                {
                  if(formkey.currentState.validate())
                  {
                    dynamic result =   await _auth.SignInphone(PhoneNumber, Passowrd);
                    if(result == null)
                    {
                      setState(() {
                        error = 'Plz Provide Correct details or Reregister';
                      });
                    }

                  }
                },
              ),
              SizedBox(height: 20.0),
              Text(
                error,
              )
            ],
          ),
        )
      ),
    );
  }
}
