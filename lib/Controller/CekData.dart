import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_kantor/Controller/Alert.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices with ChangeNotifier {
  // var nama, email, divisi, nohp, context,jenisKelamin;
  static final dbRef = FirebaseDatabase.instance.reference();
  static FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogin;
   void cekState(){
    if(_auth.currentUser != null){
      isLogin = true;
    }else{
      isLogin = false;
    }
  }
   

  // ignore: cancel_subscriptions
  // var authState = _auth.authStateChanges();
  // ignore: missing_return
  static Future<void> signIn(context, email, password) async {
    try {
      // ignore: unused_local_variable
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      User user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // User is Login
        // return Navigator.pushReplacementNamed(context, '/Home');
        // return Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Home()));
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
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await value.user.updateProfile(displayName: nama);
        var tokenUser = value.user.uid;
        await dbRef.child("myKantor/" + tokenUser.toString() + '/' + nama).set({
          'Email': email,
          'Nama': nama,
          'No Handphone': nohp,
          'Divisi': divisi,
          'Jenis Kelamin': jenisKelamin
          // 'Divisi': divisi,
        });
        await value.user.reload();
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(tokenUser.toString())));
      });
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

  static void signOut() {
    _auth.signOut();
  }

  static Stream<User> get firebaseUserStream => _auth.authStateChanges();
  
}

class SignInSignUpResult {
  final String message;

  SignInSignUpResult({this.message});
}
