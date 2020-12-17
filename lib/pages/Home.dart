import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  User user;
  // final int clientID;
  HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text('Hi ' + widget.user.displayName.toString(),style: TextStyle(fontSize:30),))
        ],
      )))
    ]);
  }
}
