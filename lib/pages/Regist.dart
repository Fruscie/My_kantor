import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_kantor/Widget/Button.dart';



class Regist extends StatefulWidget {
  @override
  _RegistState createState() => _RegistState();
}

class _RegistState extends State<Regist> {
  List _listDivisi = [
    "Admin",
    "Manager",
  ];
  List _listJenisKelamin = [
    "Laki - Laki",
    "Perempuan",
  ];
  final formKey = new GlobalKey<FormState>();
  String nama, divisi, noHp, email, password, gender, jenisKelamin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Icon(
                    Icons.exit_to_app_outlined,
                    size: 30.0,
                  ),
                ))
          ],
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Center(
              child: Text("MyKantor",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontFamily: 'Louis',
                  )),
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: AnimatedContainer(
            decoration: BoxDecoration(),
            // padding: EdgeInsets.all(20.0),
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children()),
            ),
          ),
        ));
  }

  List<Widget> children() {
    return <Widget>[
      TextFormField(
        cursorColor: Theme.of(context).cursorColor,
        maxLength: 20,
        decoration: InputDecoration(
          labelText: "Nama : ",
          labelStyle: TextStyle(
            fontSize: 20,
            color: Color(0xFF6200EE),
          ),
          helperText: "example : ardhito",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF6200EE)),
          ),
        ),
        validator: (value) {
          return value.isEmpty ? "*Required" : null;
        },
        onChanged: (value) {
          setState(() {
            nama = value;
          });
        },
      ),
      TextFormField(
        cursorColor: Theme.of(context).cursorColor,
        maxLength: 20,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          labelText: "No HP : ",
          labelStyle: TextStyle(
            fontSize: 20,
            color: Color(0xFF6200EE),
          ),
          helperText: "example : 087xxxxx",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF6200EE)),
          ),
        ),
        validator: (value) {
          return value.isEmpty ? "*Required" : null;
        },
        onChanged: (value) {
          setState(() {
            noHp = value;
          });
        },
      ),
      Container(
        height: 55,
        child: DropdownButton(
          elevation: 16,
          isExpanded: true,
          value: jenisKelamin,
          underline: Container(
            height: 1,
            color: Color(0xFF6200EE),
          ),
          iconEnabledColor: Color(0xFF595959),
          items: _listJenisKelamin.map((value) {
            return DropdownMenuItem(
              child: Text(value),
              value: value,
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              jenisKelamin = value;
            });
          },
          hint: Text(
            "Jenis Kelamin",
            style: TextStyle(color: Color(0xFF6200EE), fontSize: 17),
          ),
        ),
      ),
      Container(
        height: 55,
        // padding: EdgeInsets.only(top:5.0, bottom:5.0),
        child: DropdownButton(
          isExpanded: true,
          value: divisi,
          underline: Container(
            height: 1,
            color: Color(0xFF6200EE),
          ),
          iconEnabledColor: Color(0xFF595959),
          items: _listDivisi.map((value) {
            return DropdownMenuItem(
              child: Text(value),
              value: value,
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              divisi = value;
            });
          },
          hint: Text(
            "Divisi",
            style: TextStyle(color: Color(0xFF6200EE), fontSize: 17),
          ),
        ),
      ),
      TextFormField(
        cursorColor: Theme.of(context).cursorColor,
        decoration: InputDecoration(
          labelText: "Email : ",
          labelStyle: TextStyle(
            fontSize: 20,
            color: Color(0xFF6200EE),
          ),
          helperText: "example : test@gmail.com",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF6200EE)),
          ),
        ),
        validator: (value) {
          return value.isEmpty || !value.contains('@gmail.com')
              ? "*Please enter a valid email address!!"
              : null;
        },
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
      ),
      TextFormField(
        obscureText: true,
        cursorColor: Theme.of(context).cursorColor,
        maxLength: 20,
        decoration: InputDecoration(
          labelText: "Password : ",
          labelStyle: TextStyle(
            fontSize: 20,
            color: Color(0xFF6200EE),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF6200EE)),
          ),
        ),
        validator: (value) {
          return value.length < 6
              ? "*Your password less than 6 characters!!"
              : null;
        },
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
      ),
      ButtonState(
        formKey: formKey,
        label: "Sign Up",
        email: email,
        password: password,
        divisi: divisi,
        nama: nama,
        noHp: noHp,
        jenisKelamin: jenisKelamin,
      )
    ];
  }
}
