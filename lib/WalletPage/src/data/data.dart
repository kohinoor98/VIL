import 'package:flutter/material.dart';
import '../models/credit_card_model.dart';
import '../models/payment_model.dart';
import '../models/user_model.dart';

List<CreditCardModel> getCreditCards() {
  List<CreditCardModel> creditCards = [];
  creditCards.add(CreditCardModel(
    "1950",
    "06/23",
    "https://img.favpng.com/16/3/0/indian-independence-movement-flag-of-india-png-favpng-PV6ifN75jaJiT9v9MGpwvL6js.jpg",
  ));
  return creditCards;
}

List<UserModel> getUsersCard() {
  List<UserModel> userCards = [
    UserModel("Anna", "assets/WalletImages/users/anna.jpeg", 8452),
    UserModel("Gillian", "assets/WalletImages/users/gillian.jpeg", 2000),
    UserModel("Judith", "assets/WalletImages/users/judith.jpeg", 100),
    UserModel("Kohi", "assets/kc_temp.jpg", 10100),
  ];

  return userCards;
}

List<PaymentModel> getLeaderBoardCard() {
  List<PaymentModel> leaderBoard = [
    PaymentModel(
      Icons.receipt,
      Color(0xFFffd60f),
      "Anirudh Polawar",
      "07-23",
      "20.04",
      25,
    ),
    PaymentModel(Icons.monetization_on, Color(0xFFff415f),
        "Kohinoor Chatterjee", "07-23", "14.01", 64),
    PaymentModel(
      Icons.location_city,
      Color(0xFF50f3e2),
      "Param Mirani",
      "07-23",
      "10.04",
      1151,
    ),
    PaymentModel(
      Icons.train,
      Colors.green,
      "Rahul Chughwani",
      "07-23",
      "09.04",
      37,
    ),
  ];

  return leaderBoard;
}
