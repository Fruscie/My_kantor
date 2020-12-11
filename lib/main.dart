import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_kantor/pages/Home.dart';
import 'package:my_kantor/pages/Regist.dart';
import 'package:my_kantor/pages/Login.dart';
import 'package:provider/provider.dart';
import 'Controller/CekData.dart';
import 'pages/LandingPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: unused_field
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthServices().user,
      child: MaterialApp(
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/Regist': (context) => Regist(),
          '/Home': (context) => HomePage(null),
          '/Login': (context) => LoginPage(),
        },

        title: 'MyKantor',
        theme: ThemeData(
          canvasColor: Colors.lightBlue[50],
          fontFamily: 'Louis',
          backgroundColor: Colors.lightBlue[50],
          primaryColor: Colors.cyan[600],
          accentColor: Colors.green,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
          primarySwatch: Colors.blue,
        ),
        home: LandingPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
