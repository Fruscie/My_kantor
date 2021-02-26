import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_kantor/pages/Login.dart';
import 'package:provider/provider.dart';

import 'PageController.dart';

class LandingPage extends StatelessWidget {
  // const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
   return user == null? LoginPage() : PageControl(); //Home(user);
  }
}
