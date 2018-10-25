import 'package:flutter/material.dart';

import 'home_page.dart';

class DisplayList extends StatelessWidget {
  final List<String> page;

  
  const DisplayList({@required this.page});


  @override
  Widget build(BuildContext context) {
    HomePage hp = HomePage();
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
                hp.navigateToRespectivePage(context, page[index]);
//                Navigator.push(context,MaterialPageRoute(builder: (context) => TabBarDemo()));
              },
            );
          },
        ),
      ),
    );
  }

}
