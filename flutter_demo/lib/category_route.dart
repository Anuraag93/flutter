import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';
import 'category_tile.dart';
import 'backdrop.dart';
import 'unit_converter.dart';

final _backgroundColor = Colors.green[100];

class CategoryRoute extends StatefulWidget {
  const CategoryRoute();
  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  final _categories = <Category>[];
  Category currentCategoryDisplay;
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

  static const _baseColor = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];
  static const _baseColors = <ColorSwatch>[
    ColorSwatch(0xFF6AB7A8, {
      'highlight': Color(0xFF6AB7A8),
      'splash': Color(0xFF0ABC9B),
    }),
    ColorSwatch(0xFFFFD28E, {
      'highlight': Color(0xFFFFD28E),
      'splash': Color(0xFFFFA41C),
    }),
    ColorSwatch(0xFFFFB7DE, {
      'highlight': Color(0xFFFFB7DE),
      'splash': Color(0xFFF94CBF),
    }),
    ColorSwatch(0xFF8899A8, {
      'highlight': Color(0xFF8899A8),
      'splash': Color(0xFFA9CAE8),
    }),
    ColorSwatch(0xFFEAD37E, {
      'highlight': Color(0xFFEAD37E),
      'splash': Color(0xFFFFE070),
    }),
    ColorSwatch(0xFF81A56F, {
      'highlight': Color(0xFF81A56F),
      'splash': Color(0xFF7CC159),
    }),
    ColorSwatch(0xFFD7C0E2, {
      'highlight': Color(0xFFD7C0E2),
      'splash': Color(0xFFCA90E5),
    }),
    ColorSwatch(0xFFCE9A9A, {
      'highlight': Color(0xFFCE9A9A),
      'splash': Color(0xFFF94D56),
      'error': Color(0xFF912D2D),
    }),
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

  void initState() {
    super.initState();
    for (var i = 0; i < _categoryNames.length; i++) {
      _categories.add(Category(
        icon: _categoryIcons[i],
        color: _baseColors[i],
        name: _categoryNames[i],
        units: _retrieveUnitList(_categoryNames[i]),
      ));
    }
    currentCategoryDisplay = _categories[0];
  }

  Widget _buildCategoryWidgets() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return CategoryTile(
          category: _categories[index],
          onTap: _onCategoryTap,
        );
      },
      itemCount: _categories.length,
    );
  }

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        conversion: i.toDouble(),
        name: '$categoryName unit $i',
      );
    });
  }

  void _onCategoryTap(Category value) {
    print('$value was tapped......');
    setState(() {
      currentCategoryDisplay = value;
    });
  }

  Text appBarText(String heading) {
    return Text(
      heading,
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: _backgroundColor,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        'Unit Converter',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
    );

    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(),
    );

    return Backdrop(
        currentCategory: currentCategoryDisplay,
        frontPanel: UnitConverter(category: currentCategoryDisplay),
        backPanel: listView,
        frontTitle: appBarText(currentCategoryDisplay.name),
        backTitle: appBarText('Unit Converter'));
//    return Scaffold(
//      appBar: appBar,
//      body: listView,
//    );
  }
}
