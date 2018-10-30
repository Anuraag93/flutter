import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Custom App Bar Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Row bottomAppBarChild(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => Drawer(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.search),
                          title: Text('Search App'),
                        ),
                        ListTile(
                          leading: Icon(Icons.rotate_right),
                          title: Text('Rotate App'),
                        ),
                      ],
                    ),
                  )),
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom App Bar Example'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                print('home icon pressed.');
              })
        ],
      ),
      body: Container(),
      floatingActionButton: CustomFab(
        color: Colors.blue,
        onPressed: () {print('custom fab onPressed');},
        child: Icon(Icons.healing),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        color: Colors.green,
        child: bottomAppBarChild(context),
      ),
    );
  }
}

class CustomFab extends StatefulWidget {
  final Widget child;
  final double notchMargin;
  final VoidCallback onPressed;
  final Color color;

  CustomFab({
    this.child,
    this.notchMargin: 8.0,
    this.onPressed,
    this.color,
  });

  @override
  CustomFabState createState() => CustomFabState();
}

class CustomFabState extends State<CustomFab> {
  VoidCallback _notchChange;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: widget.color,
      elevation: 5.0,
//      shape: CustomBorder(),
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          height: 55.0,
          width: 55.0,
          child: IconTheme.merge(
              data:
                  IconThemeData(color: Theme.of(context).accentIconTheme.color),
              child: widget.child),
        ),
      ),
    );
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  @override
  void deactivate() {
    if (_notchChange != null) {
      _notchChange();
    }
    super.deactivate();
  }

  Path computeNotch(Rect main, Rect fab, Offset start, Offset end){
    final Rect marginFab = fab.inflate(widget.notchMargin);
    if(!main.overlaps(marginFab)) return Path() .. lineTo(end.dx, end.dy);

    final Rect intersection = marginFab.intersect(main);
    final double notchCenter = intersection.height * (marginFab.height/2.0) / (marginFab.width/2.0);

    return Path()
        .. lineTo(marginFab.left, marginFab.top)
        .. lineTo(marginFab.center.dx, marginFab.bottom)
        .. lineTo(marginFab.right, marginFab.top)
        .. lineTo(end.dx, end.dy);
        
  }
}

class CustomBorder extends ShapeBorder{
  // TODO: implement dimensions
  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getOuterPath
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
  }

}