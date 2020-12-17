import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_kantor/pages/Profile.dart';
import 'package:my_kantor/pages/Home.dart';
import 'package:provider/provider.dart';

class PageControl extends StatefulWidget {


  @override
  _PageControlState createState() => _PageControlState();
}

class _PageControlState extends State<PageControl> {
  int bottomSelectedIndex = 0;
  PageController _controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("MyKantor",
              style: TextStyle(fontSize: 30.0, color: Colors.white)),
        ),
      ),
      body: buildPageView(user),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }

  Widget buildPageView(var user) {
    return PageView(
      controller: _controller,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[HomePage(user),ProfilePage(user),],
    );
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Account',
      )
    ];
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      _controller.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
