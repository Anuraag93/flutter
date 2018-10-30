import 'package:cook_book/choose_username.dart';
import 'package:cook_book/display_list.dart';
import 'package:cook_book/home_page.dart';
import 'package:cook_book/login.dart';
import 'package:cook_book/recieve_otp.dart';
import 'package:cook_book/snackbar.dart';
import 'package:cook_book/tabs_demo.dart';
import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(CookBook());
}


class CookBook extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    SplashScreen.tag: (context) => SplashScreen(),
    HomePage.tag: (context) => HomePage(),
    ChooseUsername.tag: (context) => ChooseUsername(),
    ReceiveOtp.tag: (context) => ReceiveOtp(),
    Login.tag: (context) => Login(),
    DisplayList.tag:(context) => DisplayList(),
    TabBarDemo.tag:(context) => TabBarDemo(),
    SnackBarDemo.tag:(context) => SnackBarDemo(),
    TabBarDemo.tag:(context) => TabBarDemo(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
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
        primaryColor: Color(0xFF5C3FC6),
        highlightColor:Color(0x3F5C3FC6),// Color(0xFFCE9A9A),
        splashColor: Color(0xFF5C3FC6),// Color(0xFF912D2D),
        errorColor: Color(0xFFFF0C36),
         primaryColorDark: Color(0xFF5C3FC6),
        accentColor: Color(0xFF5C3FC6),
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
          title: TextStyle(
            color: Color(0xFF5C3FC6),
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          )

        ),
        iconTheme: IconThemeData(
          color: Color(0xFF5B3FC5),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: Theme.of(context).textTheme.body1.copyWith(color: Color(0xFF5C3FC6)),
          hintStyle: Theme.of(context).textTheme.body2,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Color(0xFF5C3FC6),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Color(0xFF5C3FC6),
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Color(0xFFFF0C36),
              width: 1.0,
            ),
          ),
            focusedErrorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Color(0xFFFF0C36),
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
