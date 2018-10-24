import 'package:flutter/material.dart';

import 'display_list.dart';

class DrawerList extends StatefulWidget {
  final List<String> page;

  const DrawerList({Key key, @required this.page})
      : assert(page != null),
        super(key: key);

  @override
  DrawerListState createState() => DrawerListState();
}

class DrawerListState extends State<DrawerList> {
  List<String> page;
  DisplayList nav;
  List<Widget> listTiles = new List<Widget>();

  @override
  void initState() {
    super.initState();
    page = widget.page;
    nav = DisplayList(page: page);
    _buildPageList();
  }

  void _buildPageList() {
    List<Widget> _listTiles = new List<Widget>();
    _listTiles.add(DrawerHeader(
      child: Text('Drawer Header'),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    ));

    if (page != null && page.length > 0) {
      print('Entered');
      for (var i = 0; i < page.length; i++) {
        _listTiles.add(ListTile(
          title: Text(page[i]),
          onTap: () {
            Navigator.pop(context);

            nav.navigateToRespectivePage(context, page[i]);
          },
        ));
      }
    }

    setState(() {
      listTiles = _listTiles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: listTiles != null ? listTiles : [],
      ),
    );
  }
}
