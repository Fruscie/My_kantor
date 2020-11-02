import 'package:flutter/material.dart';
class ValidateFormText extends StatelessWidget {
  ValidateFormText({this.id,this.pass});
  var id;
  var pass;
  @override
  Widget build(BuildContext context) {
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
             return pass = value; }   
            ));
            
  }
}
