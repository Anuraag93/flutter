import 'package:cook_book/choose_username.dart';
import 'package:cook_book/login.dart';
import 'package:cook_book/recieve_otp.dart';
import 'package:cook_book/snackbar.dart';
import 'package:cook_book/splash_screen.dart';
import 'package:cook_book/tabs_demo.dart';
import 'package:flutter/material.dart';

import 'display_list.dart';
import 'drawer_list.dart';


class PageTags {
  String name;
  String tag;
  PageTags(this.name,this.tag);
}
class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  static List<PageTags> pageList = [
    new PageTags('Splash Screen',SplashScreen.tag),
    new PageTags('Login',Login.tag),
    new PageTags('Snackbar Demo',SnackBarDemo.tag),
    new PageTags('Tabs Demo', TabBarDemo.tag),
    new PageTags('Receive',ReceiveOtp.tag),
    new PageTags('Choose Username', ChooseUsername.tag),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            Navigator.pushNamed(context,DisplayList.tag);
          },
          child: Icon(
            Icons.add,
            color: Colors.black54,
          ),
        ),
      ),
      drawer: DrawerList(
        pageList: pageList,
      ),
    );
  }
}
