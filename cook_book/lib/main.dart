import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(CookBook());
}

class CookBook extends StatelessWidget {
  final appName = 'Cook Book';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      home: HomePage(title: appName),
//      theme: ThemeData(
//        primaryColor: Color(0xFFCE9A9A),
//        highlightColor: Color(0xFFCE9A9A),
//        splashColor: Color(0xFF912D2D),
//        errorColor: Color(0xFF912D2D),
//        accentColor: Colors.deepPurple,
//        textTheme: Theme.of(context).textTheme.apply(
//              displayColor: Colors.deepPurple,
//              bodyColor: Colors.deepPurple,
//            ),
//      ),
    );
  }
}

