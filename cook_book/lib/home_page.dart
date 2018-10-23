import 'package:flutter/material.dart';

import 'display_list.dart';
import 'drawer_list.dart';

class HomePage extends StatelessWidget {
  final String title;
  final page = ['Snackbar Demo', 'Tabs Demo'];

  HomePage({Key key, @required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Theme.of(context).accentColor,
          child: Text(
            'Text with a background color',
            style:
                Theme.of(context).textTheme.title.copyWith(color: Colors.white),
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DisplayList(page: page)));
          },
          child: Icon(
            Icons.add,
            color: Colors.black54,
          ),
        ),
      ),
      drawer: DrawerList(page: page,),
    );
  }
}
