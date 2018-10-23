import 'package:flutter/material.dart';

import 'display_list.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).accentColor,
          child: Text(
            'Text with a background color',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayList()));
          },
          child: Icon(
            Icons.add,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}


