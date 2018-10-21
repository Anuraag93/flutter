import 'package:flutter/material.dart';
import 'unit.dart';

class Category {
  final IconData icon;
  final ColorSwatch color;
  final String name;
  final List<Unit> units;
  Category({
    Key key,
    @required this.icon,
    @required this.color,
    @required this.name,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(icon != null),
        assert(units != null);
}
