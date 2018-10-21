import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'unit.dart';

const _padding = EdgeInsets.all(16.0);

class ConverterRoute extends StatefulWidget {
  final String name;
  final Color color;
  final List<Unit> units;

  const ConverterRoute({
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  bool _showValidationError = false;
  List<DropdownMenuItem> _unitMenuItems;
  double _inputValue;
  String _convertedValue = '';
  Unit _fromValue;
  Unit _toValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createDropdownMenuItems();
    _setDefaults();
  }

  void _createDropdownMenuItems() {
    var newItems = <DropdownMenuItem>[];
    for (var unit in widget.units) {
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

  void _setDefaults() {
    setState(() {
      _fromValue = widget.units[0];
      _toValue = widget.units[1];
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
    return widget.units.firstWhere((Unit unit) {
      return unit.name == unitName;
    }, orElse: null);
  }

  void _updateInputValue(String value) {
    print('I was tapped with this string $value');
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

  void _updateConversion() {
    setState(() {
      _convertedValue =
          _format(_inputValue * (_toValue.conversion / _fromValue.conversion));
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
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.display1,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                labelText: 'Input',
                labelStyle: Theme.of(context).textTheme.display1,
                errorText:
                    _showValidationError ? 'Invalid Number Entered' : null),
            onChanged: _updateInputValue,
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

    final _compareArrow = Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: RotatedBox(
        quarterTurns: 1,
        child: Icon(
          Icons.compare_arrows,
          size: 40.0,
        ),
      ),
    );
//    Transform.rotate(angle: 3.14 / 2, //math.pi/2,
//      child: Icon(
//        Icons.compare_arrows,
//        size: 40.0,
//      ),
//    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _inputGroup,
          _compareArrow,
          _outputGroup,
        ],
      ),
    );

//    final unitWidgets = widget.units.map((Unit unit) {
//      return Container(
//        color: widget.color,
//        margin: EdgeInsets.all(8.0),
//        padding: EdgeInsets.all(16.0),
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
