import 'package:flutter/material.dart';

class CategorySampleWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final _widgetHeight = 100.0;
  final _borderRadius = BorderRadius.circular(100/2);
  
  CategorySampleWidget({@required this.icon, this.color, @required this.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        borderRadius: _borderRadius,
        highlightColor: color,
        splashColor: color,

        onTap: () {
          print('I was Tapped !!');
        },
        onDoubleTap: (){
          print('I was Double Tapped !!!');
        },
        child: Container(
          height: _widgetHeight,
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    icon,
                    size: 60.0,
                  )),
              Center(
                  child: Text(
                text,
                style: TextStyle(fontSize: 24.0),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
