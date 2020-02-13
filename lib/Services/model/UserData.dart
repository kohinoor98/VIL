import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

UserData userFromJson(String str) {
  final jsonData = json.decode(str);
  return UserData.fromJson(jsonData);
}

String userToJson(UserData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class UserData {
  String userId;
  String firstName;
  String lastName;
  String email;
  int Reward;
  int data;
  int cash;
  int talk;

  UserData({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.Reward,
    this.data,
    this.cash,
    this.talk,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => new UserData(
    userId: json["userId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    Reward: json["Reward"],
    data: json["data"],
    cash: json["cash"],
    talk: json["talk"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "Reward":Reward,
    "data" : data,
    "cash": cash,
    "talk" :talk,
  };

  factory UserData.fromDocument(DocumentSnapshot doc) {
    return UserData.fromJson(doc.data);
  }
}