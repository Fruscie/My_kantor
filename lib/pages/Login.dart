import 'package:flutter/material.dart';
import 'package:my_kantor/Widget/Button.dart';
import 'package:my_kantor/pages/Regist.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String _id = "";
  String _pass = "";
  String status = "";
  // final databaseReference = FirebaseDatabase.instance.reference();
  final TextEditingController _saveid = new TextEditingController();
  final TextEditingController _savepass = new TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Center(
            child: Text("MyKantor",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontFamily: 'Louis',
                )),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.fromLTRB(40, 130.0, 40, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text("Email : ",
                              style: TextStyle(
                                fontSize: 30.0,
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                          ),
                          _fieldEmail(),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: new Text("Password : ",
                                style: new TextStyle(
                                  fontSize: 30.0,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                          ),
                          _fieldpassword(),
                        ])),
                LoginButtonState(
                    email: _id, formKey: _formKey, password: _pass),

                FlatButton(
                  padding: EdgeInsets.only(top:1),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Regist()));
                  },
                  child: Text(
                    "Don't Have Account ? Click Me ",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                // Text(_pass)
              ],
            ),
          ),
        ));
  }

  Widget _fieldpassword() {
    return Center(
        child: TextFormField(
            textAlign: TextAlign.left,
            decoration: InputDecoration(
                hintText: "Input Your Password",
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(15.0),
                  ),
                ),
                contentPadding: const EdgeInsets.all(15.0)),
            validator: (value) {
              return value.length < 6
                  ? "Your password less than 6 characters !!"
                  : null;
            },
            obscureText: true,
            onChanged: (value) {
              setState(() {
                _pass = value;
              });
            }));
  }

  Widget _fieldEmail() {
    return Center(
        child: TextFormField(
            textAlign: TextAlign.left,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                hintText: "Input Your Email",
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(15.0),
                  ),
                ),
                contentPadding: const EdgeInsets.all(15.0)),
            validator: (value) {
              return value.isEmpty || !value.contains('@gmail.com')
                  ? "Please enter a valid email address !! "
                  : null;
            },
            onChanged: (value) {
              setState(() {
                _id = value;
              });
            }));
  }
}
