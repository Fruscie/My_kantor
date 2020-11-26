import 'package:flutter/material.dart';
class TeksFormField extends StatelessWidget {
  final hinteks,email,passw,formKey,context,teks;
  // const LoginButtonState({Key key}) : super(key: key);
  TeksFormField({this.context,this.hinteks,this.email,this.passw,this.formKey,this.teks});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
    child:TextFormField(
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          hintText: hinteks,
          labelText: teks,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          contentPadding: const EdgeInsets.all(15.0)),
      // validator: (value) {
      //   return value.length < 6
      //       ? "Your password less than 6 characters !!"
      //       : null;
      // },
    ));
  }
}
