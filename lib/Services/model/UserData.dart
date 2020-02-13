import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

class UserData {


  String userId;
  String firstName;
  String lastName;
  String email;
  int Reward;
  int data;
  int cash;
  int talk;

  UserData(String user) {

    DocumentReference documentReference = Firestore.instance.document("Current_data/"+user);
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
  }

  void updatadata()
  {


  }

}