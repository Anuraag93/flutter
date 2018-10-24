import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key key}) : super(key: key);
  @override
  TabBarDemoState createState() => TabBarDemoState();
}
class TabBarDemoState extends State<TabBarDemo> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = [
    Tab(icon: Icon(Icons.directions_car)),
    Tab(icon: Icon(Icons.directions_transit)),
    Tab(icon: Icon(Icons.directions_bike)),
  ];
  TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController = new TabController(length: myTabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: myTabs,
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          controller: _tabController,
          children: myTabs.map((Tab tab) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text(tab.text),
                  RaisedButton(
                      onPressed: () { _tabController.animateTo((_tabController.index + 1) % 2);},
                    child: Text('NEXT'),
                  ),
                  RaisedButton(
                      onPressed: () {_tabController.animateTo((_tabController.index - 1) % 2);},
                    child: Text('PREVIOUS'),
                  ),
                ],
              ),
            );
          }).toList(),
//          [
//            Column(children: <Widget>[
//              Icon(
//                Icons.directions_car,
//                size: 180.0,
//              ),
//              RaisedButton(onPressed: null)
//            ]),
//            Icon(
//              Icons.directions_transit,
//              size: 180.0,
//            ),
//            Icon(
//              Icons.directions_bike,
//              size: 180.0,
//            ),
//          ],
        ),
      ),
    );
  }
}
