import 'package:VIL/Services/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:VIL/Services/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {


  final FirebaseAuth _auth = FirebaseAuth.instance;


  //Creating the user object
  User _userFromFirebaseUser(FirebaseUser user)
  {
    return user != null ? User(uid: user.uid) : null;

  }

  //auth change user stream
  Stream<User> get user
  {
    return _auth.onAuthStateChanged
            .map(_userFromFirebaseUser);
  }

    // sign in ano
    Future SignInAnon() async{
      try{
           AuthResult result =  await _auth.signInAnonymously();
           FirebaseUser user = result.user;
           return _userFromFirebaseUser(user);
      } catch(e) {

          print(e.toString());
          return null;
      }
    }

    //sign in with phone number
  Future SignInphone(String phone,String password) async{
    try{
      AuthResult result =  await _auth.signInWithEmailAndPassword(email: phone, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {

      print(e.toString());
      return null;
    }
  }


  //register with phone number
  Future RegisterPhone (String phone,String password) async
  {
    try{
      AuthResult result =  await _auth.createUserWithEmailAndPassword(email: phone, password: password);
      FirebaseUser user = result.user;
      databaseinit(user.uid);
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  void databaseinit(String userid) {

    DocumentReference documentReference = Firestore.instance.document("myData/"+userid);
    var data = {
      "UserID": userid,
      "FirstName": "FName",
      "LastName": "LName",
      "Email": userid,
      "Reward": 0,
      "DataBalance": 0,
      "Cash": 0,
      "Talktime": 0,
    };
    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }

  String userId;
  String firstName;
  String lastName;
  String email;
  int Reward;
  int data;
  int cash;
  int talk;

  void updateReward(String userid,int reward) {
  print(userid);
    DocumentReference documentReference = Firestore.instance.document("myData/"+userid);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {

          this.userId = datasnapshot.data['UserID'];
          this.firstName = datasnapshot.data['FirstName'];
          this.lastName = datasnapshot.data['LastName'];
          this.email = datasnapshot.data['Email'];
          this.Reward = datasnapshot.data['Reward'];
          this.data = datasnapshot.data['DataBalance'];
          this.cash = datasnapshot.data['Cash'];
          this.talk = datasnapshot.data['Talktime'];

      }
    });

    print(reward);
    var data = {
      "UserID": this.userId,
      "FirstName": this.firstName,
      "LastName": this.lastName,
      "Email": this.email,
      "Reward": this.Reward + reward,
      "DataBalance": this.data,
      "Cash": this.cash,
      "Talktime": this.talk,
    };
    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));

  }


  //sign out
  Future signout() async
  {
    try{
      return await  _auth.signOut();
    }
    catch(e)
      {
          print(e.toString());
          return null;
      }
  }


}