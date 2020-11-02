import 'package:flutter/material.dart';
import 'package:my_kantor/Controller/Alert.dart';
import 'package:my_kantor/Controller/CekData.dart';

class LoginButtonState extends StatelessWidget {
  var email;
  var formKey;
  var password;
  // const LoginButtonState({Key key}) : super(key: key);
  LoginButtonState ({this.formKey, this.email, this.password});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          height: 40.0,
          minWidth: 70.0,
          splashColor: Colors.blue,
          color: Colors.cyan[500],
          textColor: Colors.white,
          child: Text("Sign In"),
          onPressed: () {
            if (formKey.currentState.validate()) {
              AuthServices.signIn(context, email, password);
            }
          }),
    );
      
  }
}

