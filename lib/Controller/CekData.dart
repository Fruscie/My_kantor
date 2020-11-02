import 'package:flutter/services.dart';
import 'package:my_kantor/Controller/Alert.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<UserCredential> signIn(
      var context, String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
    // User is Login            
    String displayName = user.displayName;

    // If the above were null, iterate the provider data
    // and set with the first non null data
    for (UserInfo userInfo in user.providerData) {
        if (displayName == null && userInfo.displayName != null) {
            displayName = userInfo.displayName;
        }
    }

    showAlertDialog(context, displayName);
    }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showAlertDialog(context,'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showAlertDialog(context,'Wrong password provided for that user.');
      }
    }
  }

  static void signOut() {
    _auth.signOut();
  }
}

class SignInSignUpResult {
  final FirebaseUser user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
