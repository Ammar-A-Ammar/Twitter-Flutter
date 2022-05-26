import 'package:flutter/material.dart';

class DrawerForIcon extends StatefulWidget {
  const DrawerForIcon({Key key}) : super(key: key);

  @override
  State<DrawerForIcon> createState() => _DrawerForIconState();
}

class _DrawerForIconState extends State<DrawerForIcon> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _key,
      drawer: new Drawer(),
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.settings_applications_outlined),
          onPressed: () => _key.currentState.openDrawer(),
        ),
      ),
    );
  }
}
