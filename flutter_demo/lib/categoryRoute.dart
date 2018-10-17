import 'package:flutter/material.dart';
import 'category.dart';

final _backgroundColor = Colors.green[100];

class CategoryRoute extends StatelessWidget {
  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
//    'Cake','Radio','Terrain','Palette','Watch','Light Bulb','Gesture','Payment',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  static const _categoryIcons = <IconData>[
    Icons.cake,
    Icons.radio,
    Icons.terrain,
    Icons.palette,
    Icons.watch,
    Icons.lightbulb_outline,
    Icons.gesture,
    Icons.payment,
  ];

  Widget _buildCategoryBuilder(List<Category> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
        icon: Icons.all_inclusive,//_categoryIcons[i],
        name: _categoryNames[i],
        color: _baseColors[i],
      ));
    }

    final appBar = AppBar(
      backgroundColor: _backgroundColor,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        'Icon Name List',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
    );

    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryBuilder(categories),
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
