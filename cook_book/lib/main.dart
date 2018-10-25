import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'pin_text_field.dart';

void main() {
  runApp(CookBook());
}

class CookBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cook Book',
      home: SplashScreen(), //SplashScreen(),
//      theme: ThemeData(
//        brightness: Brightness.dark,
//        primaryColor: Colors.lightBlue[800],
//        accentColor: Colors.cyan[600],
//      ),

      theme: ThemeData(
        fontFamily: 'Raleway',
        primaryColor: Color(0xFFCE9A9A),
        highlightColor: Color(0xFFCE9A9A),
        splashColor: Color(0xFF912D2D),
        errorColor: Color(0xFF912D2D),
        accentColor: Colors.deepPurple,
        textTheme: TextTheme(
          button: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
          headline: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          subhead: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),

        ),
        iconTheme: IconThemeData(
          color: Color(0xFF5B3FC5),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black87,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(
          padding: EdgeInsets.all(10.0),
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
        ),
      ),
    );
  }
}
