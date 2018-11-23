import 'package:cook_book/materials/custom_underline_tab.dart';
import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  static String tag = 'tab-bar';
  const TabBarDemo({Key key}) : super(key: key);
  @override
  TabBarDemoState createState() => TabBarDemoState();
}

class TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = [
    //   Tab(icon: Icon(Icons.directions_car)),
    //   Tab(icon: Icon(Icons.directions_transit)),
    //   Tab(icon: Icon(Icons.directions_bike)),
    Tab(child: Text('Tab1')),
    Tab(child: Text('TabBar2')),
    Tab(child: Text('TabBarController3')),
  ];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(length: myTabs.length, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    print('Build of TabBarDemo');
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,indicatorColor: Colors.amber,
            indicator: CustomUnderlineTabIndicator(borderSide: 
                  const BorderSide (
                      color: Colors.black,
                      width: 4.0,
                      style: BorderStyle.solid,
                      )),
            controller: _tabController,
            tabs: myTabs,
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          controller: _tabController,
          children: myTabs.map((Tab tab) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  tab.child,
//                  Text(tab.text),
                  RaisedButton(
                    onPressed: () {
                      if (_tabController.index == myTabs.length - 1) {
                        //disable button
                        print('returned from next');
                        return;
                      }
                      _tabController.animateTo((_tabController.index + 1));
                    },
                    child: Text('NEXT'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_tabController.index == 0) {
                        //disable button
                        print('returned from previous');
                        return;
                      }
                      _tabController.animateTo((_tabController.index - 1));
                    },
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
