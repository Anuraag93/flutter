import 'package:meta/meta.dart';

class Unit {
  final String name;
  final double conversion;
  final String description;

  const Unit({
    @required this.name,
    @required this.conversion,
    this.description,
  })  : assert(name != null),
        assert(conversion != null);
  Unit.fromJson(Map jsonMap)
      : assert(jsonMap['name'] != null),
        assert(jsonMap['conversion'] != null),
        name = jsonMap['name'],
        conversion = jsonMap['conversion'].toDouble(),
        description = jsonMap['description'];
}
