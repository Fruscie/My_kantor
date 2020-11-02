import 'package:flutter/material.dart';

class Regist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: new AppBar(
          title: new Center(
            child: new Text("MyKantor",
                style: new TextStyle(fontSize: 30.0, color: Colors.white)),
          ),
        ),
        body: new Center(
            child: new Container(
                //id=kotak
                color: Colors.blue[400],
                width: 200.0,
                height: 100.0,
                child: new Center(
                    child: new Icon(
                  Icons.ac_unit,
                  color: Colors.yellow[200],
                  size: 70.0,
                )))));
  }
}
