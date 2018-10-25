import 'package:flutter/material.dart';

import 'display_list.dart';
import 'drawer_list.dart';
import 'snackbar.dart';
import 'tabs_demo.dart';
import 'splash_screen.dart';
import 'login.dart';
import 'recieve_otp.dart';

class HomePage extends StatelessWidget {
  final page = [
    'Splash Screen',
    'Login',
    'Snackbar Demo',
    'Tabs Demo',
    'Receive',
    'Choose Username'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cook Book',
          style: Theme.of(context).textTheme.headline,
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Theme.of(context).accentColor,
          child: Text(
            'Text with a background color',
            style:
                Theme.of(context).textTheme.title.copyWith(color: Colors.white),
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DisplayList(page: page)));
          },
          child: Icon(
            Icons.add,
            color: Colors.black54,
          ),
        ),
      ),
      drawer: DrawerList(
        page: page,
      ),
    );
  }

  navigateToRespectivePage(BuildContext context, String page,
      {String mobile = ''}) {
    MaterialPageRoute route =
        MaterialPageRoute(builder: (context) => HomePage());

    switch (page.toLowerCase()) {
      case 'snackbar demo':
        route = MaterialPageRoute(builder: (context) => SnackBarDemo());
        break;
      case 'tabs demo':
        route = MaterialPageRoute(builder: (context) => TabBarDemo());
        break;
      case 'splash screen':
        route = MaterialPageRoute(builder: (context) => SplashScreen());
        break;
      case 'login':
        route = MaterialPageRoute(builder: (context) => Login());
        break;
      case 'receive':
        route =
            MaterialPageRoute(builder: (context) => ReceiveOtp(mobile: mobile));
        break;
      case 'choose username':
        route =
            MaterialPageRoute(builder: (context) => ReceiveOtp(mobile: mobile));
        break;
    }
    Navigator.push(context, route);
  }
}
