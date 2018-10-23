import 'package:flutter/material.dart';

import 'display_list.dart';


class DrawerList extends StatelessWidget{
  final List<String> page;

  const DrawerList({@required this.page});

  @override
  Widget build(BuildContext context) {
    DisplayList nav = DisplayList(page: page,);
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text(page[0]),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);

              nav.navigateToRespectivePage(context,page[0]);
            },
          ),
          ListTile(
            title: Text(page[1]),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              nav.navigateToRespectivePage(context,page[1]);
            },
          ),
        ],
      ),
    );
  }
}