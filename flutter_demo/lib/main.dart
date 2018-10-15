import 'package:flutter/material.dart';

import 'categoryRoute.dart';

void main() {
  runApp(UnitConversionApp());
}

class UnitConversionApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Icon Name List',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.green[100],
          highlightColor: Colors.amber,
          splashColor: Colors.amber,
          selectedRowColor: Colors.brown[400]),
      home: CategoryRoute(),
    );
  }
}