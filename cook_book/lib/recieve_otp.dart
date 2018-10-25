import 'package:cook_book/home_page.dart';
import 'package:cook_book/pin_entry_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final verticalPadding = EdgeInsets.symmetric(vertical: 15.0);

class ReceiveOtp extends StatefulWidget {
  final String mobile;
  ReceiveOtp({@required this.mobile});

  @override
  ReceiveOtpState createState() => ReceiveOtpState();
}

class ReceiveOtpState extends State<ReceiveOtp> {
  HomePage hp;
  String inputPin;
  @override
  void initState() {
    super.initState();
    hp = new HomePage();
  }

  @override
  Widget build(BuildContext context) {
    Column _buildContainer = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
            'An OTP has been sent to ${widget.mobile},\nPlease enter below.',
            style: Theme.of(context).textTheme.subhead,
          ),
        ),
        PinEntryTextField(
          fields: 6,
          showFieldAsBox: false,
          onSubmit: (pin) {
            inputPin = pin;
          },
        ),
        Padding(
          padding: verticalPadding,
          child: RaisedButton(
              color: Color(0xFF5B3FC5),
              elevation: 1.0,
              child: Text(
                'Submit',
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                hp.navigateToRespectivePage(context, 'choose username');
              }),
        ),
        Padding(
          padding: verticalPadding,
          child: Row(
            children: <Widget>[
              FlatButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30.0),
                          right: Radius.circular(30.0))),
                  onPressed: () {
                    print('Resend onPressed');
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.refresh,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      Text('Resend')
                    ],
                  )),
              FlatButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30.0),
                          right: Radius.circular(
                              30.0))), //CircleBorder(side: BorderSide(color: Colors.grey)),
                  onPressed: () {
                    print('Change Number onPressed');
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.edit,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      Text('Change Number')
                    ],
                  )),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(child: _buildContainer),
      ),
    );
  }
}

//class ReceiveOtpState extends State<ReceiveOtp> {
//  FocusNode _textNode = new FocusNode();
//  TextEditingController _controller = new TextEditingController();
//  bool isFocusNeeded = true;
//  void _handleSubmitted(String finalinput) {
//    print('handleSubmitted');
//    setState(() {
//      SystemChannels.textInput
//          .invokeMethod('TextInput.hide'); //hide keyboard again
//      _controller.clear();
//    });
//  }
//
//  handleKey(RawKeyEvent key) {
//    print("Event runtimeType is ${key.runtimeType}");
//    if (key.runtimeType.toString() == 'RawKeyDownEvent') {
//      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
//      String _keyCode;
//      _keyCode = data.keyCode.toString(); //keycode of key event (66 is return)
//
//      print("why does this run twice $_keyCode");
//    }
//  }
//
//  _buildTextComposer() {
//    TextField _textField = new TextField(
//      controller: _controller,
//      onSubmitted: _handleSubmitted,
//    );
//
//    print('requesting focus isFocusNeeded : $isFocusNeeded');
//    if (isFocusNeeded) {
//      FocusScope.of(context).requestFocus(_textNode);
//      isFocusNeeded = false;
//    }
//    return Padding(
//      padding: const EdgeInsets.all(20.0),
//      child: new RawKeyboardListener(
//        focusNode: _textNode,
//        onKey: (key) => handleKey(key),
//        child: _textField,
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
////    isFocusNeeded = true;
//    Container _buildContainer = Container(
////    margin: EdgeInsets.all(2.0),
//      width: 50.0,
//      height: 50.0,
//      child: TextField(
//        maxLength: 1,
//        textAlign: TextAlign.center,
//      ),
//    );
//
//    return Scaffold(
//        backgroundColor: Colors.white,
//        resizeToAvoidBottomPadding: true,
//        body: Center(
//            child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            _buildTextComposer(),
//            Row(
//              mainAxisSize: MainAxisSize.max,
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                _buildContainer,
//                _buildContainer,
//                _buildContainer,
//                _buildContainer,
//                _buildContainer,
//                _buildContainer,
//              ],
//            ),
//          ],
//        )));
//  }
//}
//
//class KeyboardListener extends StatefulWidget {
//  @override
//  KeyboardListenerState createState() => KeyboardListenerState();
//}
//
//class KeyboardListenerState extends State<KeyboardListener> {
//  TextEditingController _controller = new TextEditingController();
//  FocusNode _textNode = new FocusNode();
//
//  @override
//  initState() {
//    print('initState');
//    super.initState();
//  }
//
//  //Handle when submitting
//  void _handleSubmitted(String finalinput) {
//    print('_handleSubmitted');
//    setState(() {
//      SystemChannels.textInput
//          .invokeMethod('TextInput.hide'); //hide keyboard again
//      _controller.clear();
//    });
//  }
//
//  handleKey(RawKeyEventDataAndroid key) {
//    print('handleKey');
//    String _keyCode;
//    _keyCode = key.keyCode.toString(); //keycode of key event (66 is return)
//
//    print("why does this run twice $_keyCode");
//  }
//
//  _buildTextComposer() {
//    TextField _textField = new TextField(
//      controller: _controller,
//      onSubmitted: _handleSubmitted,
//    );
//
//    FocusScope.of(context).requestFocus(_textNode);
//    print('_buildTextComposer');
//    return new RawKeyboardListener(
//        focusNode: _textNode,
//        onKey: (key) => handleKey(key.data),
//        child: _textField);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(title: new Text("Search Item")),
////      body: _buildTextComposer(),
//      body: PinEntryTextField(
//        fields: 6,
//        onSubmit: (){print('PinEntryTextField onSubmit');},
//      ),
//    );
//  }
//}
