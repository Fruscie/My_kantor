
import 'package:flutter/material.dart';


showAlertDialog(BuildContext context,String konteks) {
  // set up the button
  Widget okButton = FlatButton(
    child : Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Theme.of(context).backgroundColor,
    title: Text("Alert!!!"),
    content: Text(konteks),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
