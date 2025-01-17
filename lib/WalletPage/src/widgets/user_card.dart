import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserCardWidget extends StatelessWidget {
  final UserModel user;
  const UserCardWidget({Key key, this.user})
      : assert(user != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150.0,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlue.shade50,
            blurRadius: 8.0,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(user.profilePic),
            radius: 22,
            backgroundColor: Color(0xfff1f3f5),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              user.name,
              style: TextStyle(
                  inherit: true,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Colors.grey),
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
            ),
          ),
          // Text(
          //   user.points.toString(),
          //   style: TextStyle(
          //       inherit: true,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 14.0,
          //       color: Colors.grey),
          //   overflow: TextOverflow.fade,
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }
}
