import 'package:VIL/Services/model/user.dart';
import 'package:VIL/WalletPage/src/models/user_model.dart';
import 'package:VIL/pages/Authenticate/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthServices {
  List<UserModel> userCards  ;
  final databaseReference = Firestore.instance;

  void getData() async
  {

    databaseReference
        .collection("LeaderBoard")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) async {userCards.add(UserModel(f.data['Name'],"assets/WalletImages/users/anna.jpeg",f.data['Score']));
      print(f.data);} );
    });

  }

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
    final FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
    DocumentReference documentReference =
        Firestore.instance.document("myData/" + userid);
    firebaseMessaging.getToken().then((token) {
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
        "pushToken" :token,
        "LPG" : 0,
        "Travel" : 0,
        "HealthCare":0,
        "NWE":0,
        "Banking":0,
        "Food":0,
        "Shopping":0,
        "Working and Productive":0,
      };
      documentReference.setData(data).whenComplete(() {
        print("Document Added");
      }).catchError((e) => print(e));
      var tokendata = {
        "pushToken" :token,
      };
      DocumentReference doc =
      Firestore.instance.document("Token/" + userid);
      doc.setData(tokendata).whenComplete(() {
        print("Document Added");
      }).catchError((e) => print(e));

    }).catchError((err) {
      Fluttertoast.showToast(msg: err.message.toString());
    });


  }



  void updateReward(String userid, int r) async {
    print(userid);
    print("IIIIIII\n\n\n\n\n\n");
    DocumentReference documentReference =
        Firestore.instance.document("myData/" + userid);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        this.reward = datasnapshot.data['Reward'];
      }
    });
    this.reward = this.reward+r;
    var data = {
      "Reward": this.reward,
    };

    documentReference.updateData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }


  void updateCash(String userid, int c) async {

    DocumentReference documentReference =
    Firestore.instance.document("myData/" + userid);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        this.cash = datasnapshot.data['Cash'];
      }
    });
  this.cash = this.cash + c;
    var data = {
      "Cash": this.cash,
    };
    documentReference.updateData(data).whenComplete(() {
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


  //Game API's
  void updatescore(int score,String n,String userid)
  {
    DocumentReference documentReference =
    Firestore.instance.document("LeaderBoard/" + userid);
    var data = {
      "Name": n,
      "Score": score,

    };
    documentReference.updateData(data).whenComplete(() {
      print("Score Document Added");
    }).catchError((e) => print(e));
  }



  String getusername(String userid)
  {
    DocumentReference documentReference =
    Firestore.instance.document("myData/" + userid);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        this.firstName = datasnapshot.data['FirstName'];
      }
    });
    return this.firstName;
  }

  int getReward(String userid)
  {
    DocumentReference documentReference =
    Firestore.instance.document("myData/" + userid);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        reward = datasnapshot.data['Reward'];
      }
    });
    return reward;
  }

  void updatecategory(String category,String userid,int val)
  {
    int temp,temp2;
    DocumentReference documentReference =
    Firestore.instance.document("myData/" + userid);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        temp = datasnapshot.data[category];
        temp2 = datasnapshot.data["Reward"];
        if(val<temp2 && val>0)
          {
            var data = {
              category: temp + val,
              "Reward":temp2 - val,
            };
            documentReference.updateData(data).whenComplete(() {
              print("Score Document Added");
            }).catchError((e) => print(e));
          }

      }
    });
  }

  int temp;
  int getcategorymin(String category)
  {

    DocumentReference documentReference =
    Firestore.instance.document("Vouchers/" + category);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        this.temp = datasnapshot.data['Max'];

      }
    });

    print("\n\nRewards Send ${this.temp}\n\n");
    return this.temp;

  }

}
