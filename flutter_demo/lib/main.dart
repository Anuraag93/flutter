import 'package:flutter/material.dart';
import 'category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Build Category',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.green[100],
          highlightColor: Colors.amber,
          splashColor: Colors.amber,
          selectedRowColor: Colors.brown[400]),
      home: Scaffold(
        body: Center(
          child: ListView(
            children: <Widget>[
              CategorySampleWidget(
                  icon: categories[0].icon, color: categories[0].color, text: categories[0].text),
              CategorySampleWidget(
                  icon: categories[1].icon, color: categories[1].color, text: categories[1].text),
              CategorySampleWidget(
                  icon: categories[2].icon, color: categories[2].color, text: categories[2].text),
              CategorySampleWidget(
                  icon: categories[3].icon, color: categories[3].color, text: categories[3].text),
              CategorySampleWidget(
                  icon: categories[4].icon, text: categories[4].text),
              CategorySampleWidget(
                  icon: categories[5].icon, color: categories[5].color, text: categories[5].text),
              CategorySampleWidget(
                icon: categories[6].icon, text: categories[6].text,color: categories[6].color,)
            ],
          ),
        ),
      ),
    );
  }
}

class Category {
  final IconData icon;
  final Color color;
  final String text;

  const Category(this.icon, this.color, this.text);
}

const List<Category> categories = const <Category>[
  Category(Icons.cake, Colors.green, 'Cake'),
  Category(Icons.radio, Colors.blue, 'Radio'),
  Category(Icons.terrain, Colors.pink, 'Terrain'),
  Category(Icons.palette, Colors.red, 'Palette'),
  Category(Icons.watch, Colors.white, 'Watch'),
  Category(Icons.lightbulb_outline, Colors.purple, 'Light Bulb'),
  Category(Icons.gesture, Colors.tealAccent, 'Gesture'),
];
