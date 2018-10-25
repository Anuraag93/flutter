import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';

final verticalPadding = EdgeInsets.symmetric(vertical: 15.0);

class Login extends StatefulWidget {

  @override
  LoginState createState() => LoginState();
}

final _margin = EdgeInsets.symmetric(vertical: 20.0);

class LoginState extends State<Login> {
  String inputNumber;
  bool showValidationError = false;
  HomePage hp;

  @override
  void initState() {
    super.initState();
    hp = HomePage();
  }

  final displayLogo = Image(
    image: AssetImage("assets/images/launch_logo.png"),
    fit: BoxFit.contain,
  );

  void _updateInputNumber(String value) {
    String _input;
    if (value != null && value.isNotEmpty) {
      try {
        var parsing = int.parse(value.trim());
        print('Input Value = $parsing');
        _input = value.trim();
        showValidationError = false;
      } on Exception catch (e) {
        _input = '';
        print('**************************************\nError Occured : $e');
        showValidationError = true;
      }
      setState(() {
        inputNumber = _input;
      });
    }
  }

  void _navToOtpScreen(String btnText) {

    switch(btnText.toLowerCase().trim()) {
      case 'receive otp':
        if (inputNumber.length == 10) {
          hp.navigateToRespectivePage(context, 'receive', mobile: inputNumber);
        }
        break;
      case 'login with facebook':
        hp.navigateToRespectivePage(context, 'receive');
        break;
      case 'login with google':
        hp.navigateToRespectivePage(context, 'receive');
        break;
  }
  }

  RaisedButton _buildRaisedButton(String btnText, IconData icon, Color color) {
    return RaisedButton(
elevation: 1.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Divider(
            indent: 10.0,
          ),
          Text(
            btnText,
            style: Theme.of(context).textTheme.button,
          ),
        ],
      ),
      color: color, //Colors.deepPurple[400],
      onPressed: () => _navToOtpScreen(btnText.toLowerCase()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Container _inputPhoneNumber = Container(
      padding: verticalPadding,
      child: TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(10)
        ],
        autofocus: false,
        decoration: InputDecoration(
          labelText: 'Phone Number',
          labelStyle: Theme.of(context).textTheme.body1,
          hintText: 'Enter your phone number',
          hintStyle: Theme.of(context).textTheme.body2,
        ),
        textAlign: TextAlign.left,
        keyboardType: TextInputType.number,
        onChanged: _updateInputNumber,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,mainAxisSize: MainAxisSize.max,
          children: <Widget>[

            Padding(
              padding: verticalPadding,
              child: Image(
                image: AssetImage("assets/images/launch_logo.png"),
                fit: BoxFit.contain,
                width: 100.0,
                height: 100.0,
              ),
            ),
            Padding(
              padding: verticalPadding,
              child: Text(
                'Log in with OTP',
                style: Theme.of(context).textTheme.headline,
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: verticalPadding,
              child: Text(
                'Your number is safe with us. We won\'t share your details to anyone.',
                style: Theme.of(context).textTheme.subhead,
                textAlign: TextAlign.left,
              ),
            ),
            _inputPhoneNumber,
            _buildRaisedButton('Receive OTP', Icons.message, Color(0xFF5B3FC5)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                  Divider(
                    height: 10.0,
                    color: Colors.black,
                  ),
                    Container(
                    color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text('Or', style: Theme.of(context).textTheme.subhead,),
                    ),
                ],)),
            _buildRaisedButton(
                'Login with Facebook', Icons.message, Color(0xFF334D92)),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: _buildRaisedButton(
                  'Login with Google', Icons.message, Color(0xFFcd3f30)),
            ),
          ],
        ),
      ),
    );
  }
}
