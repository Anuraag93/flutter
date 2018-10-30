import 'package:flutter/material.dart';

class ChooseUsername extends StatefulWidget {
  static String tag = 'choose-username';

  @override
  ChooseUsernameState createState() => ChooseUsernameState();
}

class ChooseUsernameState extends State<ChooseUsername> {
  final _purple = Color(0x3F5C3FC6);
  @override
  Widget build(BuildContext context) {
    Container _buildTextField(String label,
        {bool showValidationError = false}) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: TextField(
            decoration: InputDecoration(
          border: Theme.of(context)
              .inputDecorationTheme
              .border
              .copyWith(borderSide: BorderSide(color: _purple)),
//              prefixIcon: Icon(Icons.account_box, color: Theme.of(context).iconTheme.color,),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.close,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              label.toLowerCase() == 'name'
                  ? debugPrint('$label Close Icon onPressed')
                  : print('$label Close Icon onPressed');
            },
          ),
          labelText: label,
//              labelStyle: TextStyle(color: ),
          errorText: showValidationError ? 'Username already exists.' : null,
        )),
      );
    }



    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              print('save onPressed');
            },
            child: Text(
              'SAVE',
              style: Theme.of(context).textTheme.title,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildTextField('Name'),
              _buildTextField('Username'),
            ],
          ),
        ),
      ),
    );
  }
}
