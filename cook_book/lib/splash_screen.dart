import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  static String tag = 'splash-screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  CurvedAnimation _iconAnimation;

  void handleTimeout() {
    Navigator.of(context).pushReplacementNamed(HomePage.tag);
  }

  startTimeout() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, handleTimeout);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _iconAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    _iconAnimation =
        CurvedAnimation(parent: _iconAnimationController, curve: Curves.bounceIn);
    _iconAnimation.addListener(() => this.setState(() {}));

    _iconAnimationController.forward();

    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
            child: Image(
          image: AssetImage("assets/images/launch_logo.png"),
          width: _iconAnimation.value * 100,
          height: _iconAnimation.value * 100,
        )),
      ),
    );
  }
}
