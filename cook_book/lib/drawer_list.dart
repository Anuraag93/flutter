import 'package:flutter/material.dart';
import 'home_page.dart';

class DrawerList extends StatefulWidget {
  final List<PageTags> pageList;

  const DrawerList({Key key, @required this.pageList})
      : assert(pageList != null),
        super(key: key);

  @override
  DrawerListState createState() => DrawerListState();
}

class DrawerListState extends State<DrawerList> {

  List<Widget> listTiles = new List<Widget>();

  @override
  void initState() {
    super.initState();
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

    if (widget.pageList != null && widget.pageList.length > 0) {
      for (var i = 0; i < widget.pageList.length; i++) {
        _listTiles.add(ListTile(
          title: Text(widget.pageList[i].name),
          onTap: () {
//            Navigator.pop(context);
            Navigator.pushNamed(context, widget.pageList[i].tag);
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
