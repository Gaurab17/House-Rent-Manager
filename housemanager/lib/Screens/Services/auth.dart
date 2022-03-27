// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable, unnecessary_null_comparison

import 'package:brewapp/Screens/Models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brewapp/Screens/Models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  UserMod? _userFromFirebase(User? user) {
    return user != null ? UserMod(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserMod?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  //Sign in anon
  Future SignInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user!);
    } catch (e) {
      print(e.toString());
    }
  }

  // sign in with email and password
  Future SignInWithEmailAndPassword(String email,String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
    }
  }

  // register with email and password
  // Future RegisterWithEmailAndPassword(String email, String password) async {
  //   try {
  //     UserCredential result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     User? user = result.user;
  //     return _userFromFirebase(user);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
/////////////Register with the help of users_model
///












  // sign out
  Future SignOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
