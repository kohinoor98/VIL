import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

class UserData {


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


}