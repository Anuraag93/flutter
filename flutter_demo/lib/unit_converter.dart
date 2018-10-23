import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'unit.dart';
import 'category.dart';
import 'api.dart';

const _padding = EdgeInsets.all(16.0);

class UnitConverter extends StatefulWidget {
//  final String name;
//  final Color color;
//  final List<Unit> units;
  final Category category;

  const UnitConverter({
    @required this.category,
  }) : assert(category != null);

  @override
  _UnitConverterState createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  bool _showValidationError = false;
  List<DropdownMenuItem> _unitMenuItems;
  double _inputValue;
  String _convertedValue = '';
  Unit _fromValue;
  Unit _toValue;
  final _inputKey = GlobalKey(debugLabel: 'inputText');
  TextEditingController inputController;
  @override
  void initState() {
    super.initState();
    createDropdownMenuItems();
    setDefaults();
    inputController = new TextEditingController();
  }

  @override
  void didUpdateWidget(UnitConverter oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.category != oldWidget.category) {
      print('oldWidget.category was not similar');
      createDropdownMenuItems();
      setDefaults();
      inputController.text = '';
    }
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void createDropdownMenuItems() {
    var newItems = <DropdownMenuItem>[];
    for (var unit in widget.category.units) {
      newItems.add(DropdownMenuItem(
        value: unit.name,
        child: Container(
          child: Text(
            unit.name,
            softWrap: true,
          ),
        ),
      ));
    }
    setState(() {
      _unitMenuItems = newItems;
    });
  }

  void setDefaults() {
    setState(() {
      _fromValue = widget.category.units[0];
      _toValue = widget.category.units[1];
      _updateInputValue('');
    });
  }

  void _updateFromConversion(dynamic unitName) {
    setState(() {
      _fromValue = _getUnit(unitName);
    });
    if (_inputValue != null) {
      _updateConversion();
    }
  }

  void _updateToConversion(dynamic unitName) {
    setState(() {
      _toValue = _getUnit(unitName);
    });
    if (_inputValue != null) {
      _updateConversion();
    }
  }

  Unit _getUnit(String unitName) {
    return widget.category.units.firstWhere((Unit unit) {
      return unit.name == unitName;
    }, orElse: null);
  }

  void _updateInputValue(String value) {
    setState(() {
      if (value == null || value.isEmpty) {
        _convertedValue = '';
      } else {
        try {
          final inputValue = double.parse(value);
          _showValidationError = false;
          _inputValue = inputValue;
          _updateConversion();
        } on Exception catch (e) {
          print('User Input Value is $value throws this error $e');
          _showValidationError = true;
        }
      }
    });
  }

  Future<void> _updateConversion() async{

      double value;
      if(widget.category.name.toLowerCase() == 'currency') {
        value = await Api().convert(
          'currency',
          _fromValue.name,
          _toValue.name,
          _inputValue.toString()
        );
      } else {
        value = _inputValue * (_toValue.conversion / _fromValue.conversion);
      }
      setState(() {
        _convertedValue = _format(value);
      });
  }

  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  Widget _createDropdown(String name, ValueChanged<dynamic> onChanged) {
    final _colors = Colors.grey;
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        color: _colors[50],
        border: Border.all(
          width: 1.0,
          color: _colors[400],
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Theme(
          data: Theme.of(context).copyWith(canvasColor: _colors[50]),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                value: name,
                items: _unitMenuItems,
                onChanged: onChanged,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _inputGroup = Container(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            key: _inputKey,
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.display1,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
              labelText: 'Input',
              labelStyle: Theme.of(context).textTheme.display1,
              errorText: _showValidationError ? 'Invalid Number Entered' : null,
            ),
            onChanged: _updateInputValue,
            controller: inputController,
          ),
          _createDropdown(_fromValue.name, _updateFromConversion),
        ],
      ),
    );
    final _outputGroup = Container(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InputDecorator(
            child: Text(
              _convertedValue,
              style: Theme.of(context).textTheme.display1,
            ),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
              labelText: 'Output',
              labelStyle: Theme.of(context).textTheme.display1,
            ),
          ),
          _createDropdown(_toValue.name, _updateToConversion),
        ],
      ),
    );

    final _compareArrow = RotatedBox(
      quarterTurns: 1,
      child: Icon(
        Icons.compare_arrows,
        size: 40.0,
      ),
    );
//    Transform.rotate(angle: 3.14 / 2, //math.pi/2,
//      child: Icon(
//        Icons.compare_arrows,
//        size: 40.0,
//      ),
//    );
    final converter = Column(
      children: [
        _inputGroup,
        _compareArrow,
        _outputGroup,
      ],
    );

    return Padding(
      padding: _padding,
      child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.portrait) {
          return SingleChildScrollView(
            child: converter,
          );
        } else {
          return SingleChildScrollView(
            child: Center(
              child: Container(
                width: 450.0,
                child: converter,
              ),
            ),
          );
        }
      }),
    );

//    final unitWidgets = widget.units.map((Unit unit) {
//      return Container(
//        color: widget.color,
//        margin: EdgeInsets.all(8.0),
//        padding: _padding,
//        child: Column(
//          children: <Widget>[
//            Text(
//              unit.name,
//              style: Theme.of(context).textTheme.headline,
//            ),
//            Text(
//              'Conversion: ${unit.conversion}',
//              style: Theme.of(context).textTheme.subhead,
//            ),
//          ],
//        ),
//      );
//    }).toList();
//
//    return ListView(
//      children: unitWidgets,
//    );
  }
}
