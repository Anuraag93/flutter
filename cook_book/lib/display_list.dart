import 'package:flutter/material.dart';

import 'home_page.dart';
import 'snackbar.dart';
import 'tabs_demo.dart';

class DisplayList extends StatelessWidget {
  final page = ['Snackbar Demo', 'Tabs Demo'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Display Page List'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: page.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${page[index]}'),
              onTap: (){
                _navigateToRespectivePage(context, page[index]);
//                Navigator.push(context,MaterialPageRoute(builder: (context) => TabBarDemo()));
              },
            );
          },
        ),
      ),
    );
  }

  _navigateToRespectivePage(BuildContext context, String page) {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) => HomePage(title: 'Cook Book',));

    switch(page.toLowerCase()){
      case 'snackbar demo':
        route = MaterialPageRoute(builder: (context) => SnackBarDemo());
        break;
      case 'tabs demo':
        route = MaterialPageRoute(builder: (context) => TabBarDemo());
        break;
    }

    Navigator.push(context, route);
  }
}