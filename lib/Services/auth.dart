import 'package:VIL/Services/model/user.dart';
import 'package:VIL/pages/Authenticate/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:VIL/Services/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {

  String userId;
  String firstName;
  String lastName;
  String PhoneNumber;
  String email;
  int reward;
  int data;
  int cash;
  int talk;

  AuthServices()
  {
    DocumentReference documentReference =
    Firestore.instance.document("myData/");
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        this.userId = datasnapshot.data['UserID'];
        this.firstName = datasnapshot.data['FirstName'];
        this.lastName = datasnapshot.data['LastName'];
        this.email = datasnapshot.data['Email'];
        this.reward = datasnapshot.data['Reward'];
        this.data = datasnapshot.data['DataBalance'];
        this.cash = datasnapshot.data['Cash'];
        this.talk = datasnapshot.data['Talktime'];
        this.PhoneNumber = datasnapshot.data['PhoneNumber'];
        //print(userid);
      }
    });

  }


  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Creating the user object
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // sign in ano
  // Future signInAnon() async {
  //   try {
  //     AuthResult result = await _auth.signInAnonymously();
  //     FirebaseUser user = result.user;
  //     return _userFromFirebaseUser(user);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  //sign in with phone number
  Future signInPhone(String phone, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: phone, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  void start(String userid) {
    DocumentReference documentReference =
    Firestore.instance.document("myData/" + userid);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        {
          this.userId = datasnapshot.data['UserID'];
          this.firstName = datasnapshot.data['FirstName'];
          this.lastName = datasnapshot.data['LastName'];
          this.email = datasnapshot.data['Email'];
          this.reward = datasnapshot.data['Reward'];
          this.data = datasnapshot.data['DataBalance'];
          this.cash = datasnapshot.data['Cash'];
          this.talk = datasnapshot.data['Talktime'];
        };
      }
    });
  }


  //register with phone number
  Future registerPhone(
      String phone, String password, String phoneNumber) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: phone, password: password);
      FirebaseUser user = result.user;
      databaseinit(user.uid, phoneNumber, fName, lName);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void databaseinit(
      String userid, String phoneNumber, String fName, String lName) {
    DocumentReference documentReference =
        Firestore.instance.document("myData/" + userid);
    var data = {
      "UserID": userid,
      "PhoneNumber": phoneNumber,
      "FirstName": fName,
      "LastName": lName,
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



  void updateReward(String userid, int reward) {
    print(userid);
    DocumentReference documentReference =
        Firestore.instance.document("myData/" + userid);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        this.userId = datasnapshot.data['UserID'];
        this.firstName = datasnapshot.data['FirtstName'];
        this.lastName = datasnapshot.data['LastName'];
        this.email = datasnapshot.data['Email'];
        this.reward = datasnapshot.data['Reward'];
        this.data = datasnapshot.data['DataBalance'];
        this.cash = datasnapshot.data['Cash'];
        this.talk = datasnapshot.data['Talktime'];
        this.PhoneNumber = datasnapshot.data['PhoneNumber'];
      }
    });

    print(reward);
    var data = {
      "UserID": this.userId,
      "FirstName": this.firstName,
      "LastName": this.lastName,
      "Email": this.email,
      "Reward": this.reward + reward,
      "DataBalance": this.data,
      "Cash": this.cash,
      "Talktime": this.talk,
      "PhoneNumber": this.PhoneNumber,
    };
    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }


  void updateCash(String userid, int c) async {

    DocumentReference documentReference =
    Firestore.instance.document("myData/" + userid);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        this.userId = datasnapshot.data['UserID'];
        this.firstName = datasnapshot.data['FirstName'];
        this.lastName = datasnapshot.data['LastName'];
        this.email = datasnapshot.data['Email'];
        this.reward = datasnapshot.data['Reward'];
        this.data = datasnapshot.data['DataBalance'];
        this.cash = datasnapshot.data['Cash'];
        this.talk = datasnapshot.data['Talktime'];
        this.PhoneNumber = datasnapshot.data['PhoneNumber'];
        //print(userid);
      }
    });

    var data = {
      "UserID": this.userId,
      "FirstName": this.firstName,
      "LastName": this.lastName,
      "Email": this.email,
      "Reward": this.reward,
      "DataBalance": this.data,
      "Cash": this.cash + c,
      "Talktime": this.talk,
      "PhoneNumber": this.PhoneNumber,
    };
    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }

  //sign out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
