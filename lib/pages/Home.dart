
import 'package:flutter/material.dart';

// import 'package:firebase_database/firebase_database.dart';
//
class Home extends StatefulWidget {
  final user;
  // final int clientID;
  Home(this.user);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Text("MyKantor",
                  style: TextStyle(fontSize: 30.0, color: Colors.white)),
            ),
          ),
          body: Center(
              child: Container(
            //id=kotak
            color: Colors.blue[400],
            width: 200.0,
            height: 100.0,
            child: Text(widget.user),
          )))
    ]);
  }
}
