import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_kantor/Controller/Alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_kantor/pages/LandingPage.dart';
import 'package:my_kantor/pages/PageController.dart';

class AuthServices with ChangeNotifier {
  // var nama, email, divisi, nohp, context,jenisKelamin;
  static final dbRef = FirebaseDatabase.instance.reference();
  static FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogin;

  User _userFromFirebaseUser(User user) {
    return (user != null) ? user : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth
        .authStateChanges()
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  void cekState() {
    if (_auth.currentUser != null) {
      isLogin = true;
    } else {
      isLogin = false;
    }
  }

  // ignore: cancel_subscriptions
  // var authState = _auth.authStateChanges();
  // ignore: missing_return
  static Future<void> signIn(context, email, password) async {
    try {
      // ignore: unused_local_variable
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = result.user;
      if (user != null) {
        // User is Login
        // return Navigator.pushReplacementNamed(context, '/Home');
        return Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageControl()));
      }

      // If the above were null, iterate the provider data
      // and set with the first non null data

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showAlertDialog(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showAlertDialog(context, 'Wrong password provided for that user.');
      }
    }
  }

  static Future<void> signUp(
      context, email, password, nama, nohp, jenisKelamin, divisi) async {
    try {
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showAlertDialog(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showAlertDialog(context, 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static void signOut(BuildContext context) {
    _auth.signOut().then((value) => Navigator.pop(
        context, MaterialPageRoute(builder: (context) => LandingPage())));
  }
}

class SignInSignUpResult {
  final String message;

  SignInSignUpResult({this.message});
}
