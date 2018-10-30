import 'package:cook_book/home_page.dart';
import 'package:cook_book/materials/diamond_notched.dart';
import 'package:flutter/material.dart';

class DisplayList extends StatelessWidget {
  static String tag = 'display-list';

  Row bottomAppBarContents = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.account_box,
                color: Colors.white,
              ),
              onPressed: () {
                print('accountbox onPressed');
              }),
          IconButton(
              icon: Icon(
                Icons.message,
                color: Colors.white,
              ),
              onPressed: () {
                print('message onPressed');
              }),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () {
                print('refresh onPressed');
              }),
          IconButton(
              alignment: Alignment.centerRight,
              icon: Icon(
                Icons.print,
                color: Colors.white,
              ),
              onPressed: () {
                print('print onPressed');
              }),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    Material _dimondFab = Material(
      color: Colors.lightBlue,
      shape: CustomBorder(),
      child: InkWell(
        onTap: () {
          print('_diamondFab onTap');
        },
        child: Container(
          width: 55.0,
          height: 55.0,
          child: IconTheme.merge(
            data: IconThemeData(color: Theme.of(context).accentIconTheme.color),
            child: Icon(Icons.healing),
          ),
        ),
      ),
      elevation: 5.0,
    );
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _dimondFab,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     print('floatingActionButton onpressed');
      //   },
      //   backgroundColor: Colors.black12,
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
      bottomNavigationBar: BottomAppBar(
        shape: DiamondNotched(),//CustomNotchedRectangle(),
        elevation: 4.0,
        notchMargin: 8.0,
        color: Theme.of(context).primaryColor,
        child: bottomAppBarContents,
      ),
      appBar: AppBar(
        title: Text('Display Page List'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: HomePage.pageList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${HomePage.pageList[index].name}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, HomePage.pageList[index].tag);
              },
            );
          },
        ),
      ),
    );
  }
}
