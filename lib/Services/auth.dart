import 'package:VIL/Services/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:VIL/Services/model/user.dart';

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
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
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