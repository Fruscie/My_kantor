import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_kantor/Controller/CekData.dart';
// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  User user;
  // final int clientID;
  ProfilePage(this.user);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //id=kotak
                color: Colors.blue[400],
                width: 200.0,
                height: 100.0,
                child: Text(widget.user.toString()),
              ),
              FlatButton(
                padding: EdgeInsets.only(top: 1),
                onPressed: () {
                  AuthServices.signOut(context);
                },
                child: Text(
                  "Sign Out ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )))
    ]);
  }
}
