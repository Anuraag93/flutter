import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car),child: Text('CAR'),),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car,size: 180.0,),
            Icon(Icons.directions_transit,size: 180.0,),
            Icon(Icons.directions_bike,size: 180.0,),
          ],
        ),
      ),
    );
  }
}
