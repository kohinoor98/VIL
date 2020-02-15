import 'package:VIL/Services/model/user.dart';
import 'package:VIL/WalletPage/src/models/user_model.dart';
import 'package:VIL/pages/Authenticate/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthServices {

  List syderlist = ['Banking Spyder','HealthCare Spyder','Food Spyder','LPG Spyder','NWE Spyder','Shopping Spyder','Travel Spyder','Working and Productive Spyder'];
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
  int LPRvoucher;
  int foodvoucher;
  int healthvoucher;
  int showvoucher;
  int travelvoucher;
  int workingvoucher;
  int nwevoucher;
  int bankvoucher;


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
        this.LPRvoucher = datasnapshot.data['LPG Voucher'];
        this.foodvoucher = datasnapshot.data['Food Voucher'];
        this.healthvoucher = datasnapshot.data['HealthCare Voucher'];
        this.showvoucher = datasnapshot.data['Shopping Voucher'];
        this.travelvoucher = datasnapshot.data['Travel Voucher'];
        this.workingvoucher = datasnapshot.data['Working and Productive Voucher'];
        this.nwevoucher = datasnapshot.data['NWE Voucher'];
        this.bankvoucher = datasnapshot.data['Banking Voucher'];
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

          this.LPRvoucher = datasnapshot.data['LPG Voucher'];
          this.foodvoucher = datasnapshot.data['Food Voucher'];
          this.healthvoucher = datasnapshot.data['HealthCare Voucher'];
          this.showvoucher = datasnapshot.data['Shopping Voucher'];
          this.travelvoucher = datasnapshot.data['Travel Voucher'];
          this.workingvoucher = datasnapshot.data['Working and Productive Voucher'];
          this.nwevoucher = datasnapshot.data['NWE Voucher'];
          this.bankvoucher = datasnapshot.data['Banking Voucher'];
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
      databaseinit(user.uid, phoneNumber, fName, lName,phone);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void databaseinit(
      String userid, String phoneNumber, String fName, String lName,String e) {
    final FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
    DocumentReference documentReference =
        Firestore.instance.document("myData/" + userid);
    firebaseMessaging.getToken().then((token) {
      var data = {
        "UserID": userid,
        "PhoneNumber": phoneNumber,
        "FirstName": fName,
        "LastName": lName,
        "Email": e,
        "Reward": 302,
        "DataBalance": 0,
        "Cash": 40,
        "Talktime": 0,
        "pushToken" :token,
        "LPG Spyder" : 1.25,
        "Travel Spyder" : 1.25,
        "HealthCare Spyder":1.25,
        "NWE Spyder":1.25,
        "Banking Spyder":1.25,
        "Food Spyder":1.25,
        "Shopping Spyder":1.25,
        "Working and Productive Spyder":1.25,
        "LPG Voucher" : 0,
        "Travel Voucher" : 0,
        "HealthCare Voucher":0,
        "NWE Voucher":0,
        "Banking Voucher":0,
        "Food Voucher":0,
        "Shopping Voucher":0,
        "Working and Productive Voucher":0,
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

  void updatecategoryVoucher(String category,String userid,int val)
  {
    int temp,temp2;
    DocumentReference documentReference =
    Firestore.instance.document("myData/" + userid);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        temp = datasnapshot.data[category];
        temp2 = datasnapshot.data["Reward"];
        if(val<=temp2 && val>=0)
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

  int getvoucherstatus(String userid,String category)
  {
    DocumentReference documentReference =
    Firestore.instance.document("myData/" + userid);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        temp = datasnapshot.data[category];
      }
    });
    return temp;
  }

  void updateSpyder(String userid,String category,var weight)
  {
    DocumentReference documentReference =
    Firestore.instance.document("myData/" + userid);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        double t = 10.0 - datasnapshot.data[category];
        if(t>0)
          {

            Map<String,double> d = {'Banking Spyder':0,'HealthCare Spyder':0,'Food Spyder':0,'LPG Spyder':0,'NWE Spyder':0,'Shopping Spyder':0,'Travel Spyder':0,'Working and Productive Spyder':0};
            for(String name in syderlist)
            {
              print(name);
              print("\n\n\n\ngggg\n\n\n\n");
              if(name == category)
              {

                double temp2 = datasnapshot.data[name]+weight;
                d[name]=temp2;
                if(temp2>10)
                  return;
                //d.putIfAbsent(name, () => temp2);
              }
              else
              {
                double temp2 = datasnapshot.data[name];
                print(temp2);

                temp2 = temp2 - ((temp2/t)*weight);
                //d.putIfAbsent(name, () => temp2);
                if(temp2<0)
                    return;
                d[name] = temp2;
              }
            }
            var ff = {
              "LPG Spyder" : d["LPG Spyder"],
              "Travel Spyder" : d["Travel Spyder"],
              "HealthCare Spyder":d[ "HealthCare Spyder"],
              "NWE Spyder":d["NWE Spyder"],
              "Banking Spyder":d["Banking Spyder"],
              "Food Spyder":d["Food Spyder"],
              "Shopping Spyder":d[ "Shopping Spyder"],
              "Working and Productive Spyder":d[ "Working and Productive Spyder"],
            };
            print(d[ "Working and Productive Spyder"]);
            documentReference.updateData(ff).whenComplete(() {
              print("Score Document Added");
            }).catchError((e) => print(e));

          }

        }

    });

  }

}
