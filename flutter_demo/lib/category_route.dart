import 'package:flutter/material.dart';

import 'category.dart';
import 'unit.dart';
import 'category_tile.dart';
import 'backdrop.dart';
import 'unit_converter.dart';
import 'api.dart';

import 'dart:async';
import 'dart:convert';

//final _backgroundColor = Colors.green[100];

class CategoryRoute extends StatefulWidget {
  const CategoryRoute();
  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  final _categories = <Category>[];
  Category _currentCategory;
  Category _defaultCategory;
  Api api = Api();

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

//  @override
//  void initState() {
//    super.initState();
//    for (var i = 0; i < _categoryNames.length; i++) {
//      _categories.add(Category(
//        icon: _categoryIcons[i],
//        color: _baseColors[i],
//        name: _categoryNames[i],
//        units: _retrieveUnitList(_categoryNames[i]),
//      ));
//    }
//    _defaultCategory = _categories[0];
//  }
//  List<Unit> _retrieveUnitList(String categoryName) {
//    return List.generate(10, (int i) {
//      i += 1;
//      return Unit(
//        conversion: i.toDouble(),
//        name: '$categoryName unit $i',
//      );
//    });
//  }
  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (_categories.isEmpty) {
      await _retrieveLocalCategories();
      await _retrieveApiCategories();
    }
  }

  Future<void> _retrieveLocalCategories() async {
    final json = DefaultAssetBundle.of(context)
        .loadString('assets/data/regular_units.json');
    final data = JsonDecoder().convert(await json);

    if (data is! Map) {
      throw ('Data recieved from the API is not map');
    }
    var categoryIndex = 0;
    data.keys.forEach((key) {
      final List<Unit> units =
          data[key].map<Unit>((dynamic data) => Unit.fromJson(data)).toList();
      var iconName = key.toString().toLowerCase();
      iconName = iconName == 'digital storage' ? 'digital_storage' : iconName;
      var category = Category(
        name: key,
        color: _baseColors[categoryIndex],
        iconLocation: 'assets/icons/$iconName.png',
        units: units,
      );
      setState(() {
        if (categoryIndex == 0) {
          _defaultCategory = category;
        }
        _categories.add(category);
      });
      categoryIndex++;
    });
  }

  Future<void> _retrieveApiCategories() async {
    String iconName = 'currency';
    setState(() {
      _categories.add(Category(
        iconLocation: 'assets/icons/$iconName.png',
        color: _baseColors.last,
        name: 'Currency',
        units: [],
      ));
    });
    List<Unit> _units = await api.getUnits(iconName);
    if (_units != null) {
      setState(() {
        _categories.removeLast();
        _categories.add(Category(
          iconLocation: 'assets/icons/$iconName.png',
          color: _baseColors.last,
          name: 'Currency',
          units: _units,
        ));
      });
    }
  }

  Widget _buildCategoryWidgets(Orientation orientation) {
    if (orientation == Orientation.portrait) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return CategoryTile(
            category: _categories[index],
            onTap: _onCategoryTap,
          );
        },
        itemCount: _categories.length,
      );
    } else {
      return GridView.builder(
          itemCount: _categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return CategoryTile(
              category: _categories[index],
              onTap: _onCategoryTap,
            );
          });
    }
  }

  void _onCategoryTap(Category value) {
    print('$value was tapped......');
    setState(() {
      _currentCategory = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_categories.isEmpty) {
      return Center(
        child: Container(
          height: 180.0,
          width: 180.0,
          child: CircularProgressIndicator(),
        ),
      );
    }

    assert(debugCheckHasMediaQuery(context));
    final listView = Container(
      padding: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 48.0,
      ),
      child: _buildCategoryWidgets(MediaQuery.of(context).orientation),
    );

    return Backdrop(
      currentCategory:
          _currentCategory == null ? _defaultCategory : _currentCategory,
      frontPanel: _currentCategory == null
          ? UnitConverter(category: _defaultCategory)
          : UnitConverter(category: _currentCategory),
      backPanel: listView,
      frontTitle: Text('Unit Converter'),
      backTitle: Text('Select a Category'),
    );
//    return Scaffold(
//      appBar: appBar,
//      body: listView,
//    );
  }
}
