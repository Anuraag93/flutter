import 'package:flutter/material.dart';

class ConverterRoute extends StatelessWidget {
  final ColorSwatch color;
  final String name;

  const ConverterRoute({Key key, this.color, @required this.name})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    bool _showValidationError = false;

    final _inputTextField = TextField(
      style: TextStyle(fontSize: 40.0),
      textAlign: TextAlign.left,
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 10.0,
          ),
          labelText: 'Input',
          labelStyle: TextStyle(fontSize: 30.0),
          errorText: _showValidationError ? 'Invalid Value' : null,
          ),
      autofocus: true,
    );


    final items = <DropdownMenuItem>[];

    for (var i = 0; i <= 8; i++) {
      items.add(DropdownMenuItem(
          child: Center(
        child: Text('Counter $i',),
      )));
    }

    final _dropDownList = DropdownButton(
      items: items,
      onChanged: null,
    );

    Container _buildIOContainer() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
//            isInput ? _inputTextField : _outputTextField,
          _inputTextField,
            _dropDownList,
          ],
        ),
      );
    }

    return ListView(padding: const EdgeInsets.all(20.0), children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildIOContainer(),
          Container(
            decoration: BoxDecoration(border: Border.all(width: 2.0)),
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.autorenew,
            ),
          ),
          _buildIOContainer(),
        ],
      ),
    ]);
  }
}
