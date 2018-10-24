import 'package:flutter/material.dart';

import 'home_page.dart';
import 'snackbar.dart';
import 'tabs_demo.dart';
import 'splash_screen.dart';

class DisplayList extends StatelessWidget {
  final List<String> page;

  
  const DisplayList({@required this.page});


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
              title: Text(
                '${page[index]}',
                style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                navigateToRespectivePage(context, page[index]);
//                Navigator.push(context,MaterialPageRoute(builder: (context) => TabBarDemo()));
              },
            );
          },
        ),
      ),
    );
  }

  navigateToRespectivePage(BuildContext context, String page) {
    MaterialPageRoute route = MaterialPageRoute(
        builder: (context) => HomePage(
              title: 'Cook Book',
            ));

    switch (page.toLowerCase()) {
      case 'snackbar demo':
        route = MaterialPageRoute(builder: (context) => SnackBarDemo());
        break;
      case 'tabs demo':
        route = MaterialPageRoute(builder: (context) => TabBarDemo());
        break;
      case 'splash screen':
        route = MaterialPageRoute(builder: (context) => SplashScreen());
        break;
    }

    Navigator.push(context, route);
  }
}
