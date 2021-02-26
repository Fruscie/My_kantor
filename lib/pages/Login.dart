import 'package:flutter/material.dart';
import 'package:my_kantor/Controller/Alert.dart';
import 'package:my_kantor/Controller/sizes_helpers.dart';
import 'package:my_kantor/Widget/Button.dart';
import 'package:my_kantor/pages/Regist.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _id, _pass, status, pwadmin, emailadmin;
  final _formKeys = new GlobalKey<FormState>();
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
        body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Center(
              child: SingleChildScrollView(
                child: AnimatedContainer(
                  width: displayWidth(context) / 1.1,
                  decoration: BoxDecoration(),
                  duration: const Duration(milliseconds: 300),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        _fieldPassw(),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        ButtonState(
                            label: "Sign In",
                            email: _id,
                            formKey: _formKey,
                            password: _pass),

                        FlatButton(
                          padding: EdgeInsets.only(top: 1),
                          onPressed: () {
                            dialogpassw();
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
                ),
              ),
            )));
  }

  dialogpassw() async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: AlertDialog(
              title: Text("Please Contact Your Administrator!"),
              content: SingleChildScrollView(
                child: Form(
                  key: _formKeys,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        autofocus: false,
                        decoration: new InputDecoration(
                          labelText: 'Email Administrator',
                        ),
                        validator: (value) {
                          return value.isEmpty || !value.contains('@gmail.com')
                              ? "Please enter a valid email address !! "
                              : null;
                        },
                        onChanged: (value) {
                          setState(() {
                            emailadmin = value;
                          });
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        autofocus: false,
                        decoration: new InputDecoration(
                          labelText: 'Password Administrator',
                        ),
                        validator: (value) {
                          return value.length < 6
                              ? "Your password less than 6 characters !!"
                              : null;
                        },
                        onChanged: (value) {
                          setState(() {
                            pwadmin = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      if (_formKeys.currentState.validate()) {
                        if ((emailadmin.toString() == "admin@gmail.com") &&
                            (pwadmin.toString() == "123456")) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Regist()));
                        } else {
                          showAlertDialog(
                              context, "Username or Password Wrong !!");
                        }
                      }
                    }),
              ],
            ));
      },
    );
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

  Widget _fieldPassw() {
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
}
