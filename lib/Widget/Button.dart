import 'package:flutter/material.dart';
import 'package:my_kantor/Controller/CekData.dart';

class ButtonState extends StatelessWidget {
  final email, formKey, password, nama, divisi, noHp, label,jenisKelamin;
  // const LoginButtonState({Key key}) : super(key: key);
  ButtonState(
      {this.label,
      this.formKey,
      this.email,
      this.password,
      this.nama,
      this.divisi,
      this.noHp,
      this.jenisKelamin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        top: 8,
        right: 20,
      ),
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          height: 40.0,
          minWidth: 70.0,
          splashColor: Colors.blue,
          color: Colors.cyan[500],
          textColor: Colors.white,
          child: Text(label),
          onPressed: () {
            if (formKey.currentState.validate()) {
              if (label == "Sign In") {
                AuthServices.signIn(context, email, password);
              } else if (label == "Sign Up") {
                AuthServices.signUp(context, email, password,nama,noHp,jenisKelamin,divisi);
                // formKey.currentState.reset();
              }
            }
          }),
    );
  }
}
