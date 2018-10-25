import 'package:cook_book/home_page.dart';
import 'package:cook_book/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinTextField extends StatefulWidget {

  @override
  PinTextFieldState createState() => PinTextFieldState();
}

class PinTextFieldState extends State<PinTextField> {
  TextEditingController _editController = TextEditingController();
  String inputPin;
  FocusNode _focusNode;
  HomePage hp;


  Container _boxContainer = Container(
    height: 50.0,
    width: 40.0,
//    margin: EdgeInsets.symmetric(horizontal: 3.0),
//color: Colors.blue,
//    decoration: UnderlineTabIndicator(
//        borderSide: BorderSide(
//            width: 2.0, style: BorderStyle.solid, color: Colors.black)),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.0),
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5.0)),
  );

  Divider _dividerIndent = Divider(
  indent: 10.0,
  );
  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    hp = HomePage();
  }

  @override
  Widget build(BuildContext context) {

    TextField buildPinTextField = TextField(
      inputFormatters: [LengthLimitingTextInputFormatter(6)],
      decoration: InputDecoration.collapsed(hintText: ''),
      style: TextStyle(color: Colors.black, fontSize: 25.0, letterSpacing:30.0),
    );

    Row buildTextFieldOutline = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _boxContainer,
        _dividerIndent,
        _boxContainer,
        _dividerIndent,
        _boxContainer,
        _dividerIndent,
        _boxContainer,
        _dividerIndent,
        _boxContainer,
        _dividerIndent,
        _boxContainer,
      ],
    );




    Row  _buildTextFieldOutline = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _boxContainer,
        _boxContainer,
        _boxContainer,
        _boxContainer,
        _boxContainer,
        _boxContainer,
      ],
    );
    Container _buildPinTextField = Container(
      padding: EdgeInsets.only(left: 15.0),
      child: TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
        ],
        keyboardType: TextInputType.number,
        controller: _editController,
        onChanged: (txt) {
          print('onChanged :::::::: $txt & txt.length = ${txt.length}');
          if (txt.length == 6) {
            print('Navigate to login');
            inputPin = txt;
//            FocusScope.of(context).requestFocus(_focusNode);
          } else if (txt.length > 6) {
            _editController.text = txt.substring(0, 6);
            print('_editController.text = ${_editController.text}');
          }
        },
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35.0,
          color: Colors.deepPurple,
          letterSpacing: 35.0,
        ),
        decoration: InputDecoration.collapsed(hintText: ''),
      ),
    );

    Container _validateOtp = Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: RaisedButton(
        child: Text('Validate'),
        onPressed: () {
          print('raisedButton onPressed sending $inputPin to login');
          hp.navigateToRespectivePage(context, 'login');
        },
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('Pin Entry'),
        ),
        body: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            _buildTextFieldOutline,
            _buildPinTextField,
          ],
        ),
//        Container(
//          margin: EdgeInsets.all(10.0),
//          child: Column(
//            children: <Widget>[
//
//              _validateOtp
//            ],
//          ),
//        )
    );
  }
}
