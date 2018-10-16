import 'package:flutter/material.dart';
import 'converterRoute.dart';

class Category extends StatelessWidget {
  final IconData icon;
  final ColorSwatch color;
  final String name;
  final _widgetHeight = 100.0;
  final _borderRadius = BorderRadius.circular(100 / 2);

  Category({@required this.icon, this.color, @required this.name});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent, //Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        borderRadius: _borderRadius,
        highlightColor: color,
        splashColor: color,
        onTap: () {
          print('I was Tapped !!');
          _navigateToConverter(context);
        },
        child: Container(
          height: _widgetHeight,
          padding: EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    icon,
                    size: 60.0,
                  )),
              Center(
                  child: Text(
                name,
                style: TextStyle(fontSize: 24.0),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToConverter(BuildContext context) {
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            name,
            style: Theme.of(context).textTheme.display1,
          ),
          centerTitle: true,
          backgroundColor: color,
        ),
        body: ConverterRoute(
          name: name,
          color: color,
        ),backgroundColor: color[100],
      );
    }));
  }
}
