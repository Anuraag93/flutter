import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final displayLogo = Image(
    image: AssetImage("assets/images/launch_logo.png"),
    fit: BoxFit.contain,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/launch_logo.png"),
              fit: BoxFit.contain,
            ),
            Text('Login With OTP',style: TextStyle(),)
          ],
        ),
      ),
    );
  }
}
