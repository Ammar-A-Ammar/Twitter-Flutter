import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../screens/Settings/notificationspage.dart';
import '../../screens/Settings/settingspage.dart';
import '../../screens/home/Timeline.dart';
import '../../API/userdata.dart';

class CustomNavBar extends StatefulWidget {
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  var _currentIndex = 0;

  List<Widget> pages = [
    TimelinePage(
      token: userdata.token,
    ),
    NotificationsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: pages[_currentIndex],
        ),
        // drawer: SideMenu(),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.blueAccent,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.notifications),
              title: Text("Notifications"),
              selectedColor: Colors.blueAccent,
            ),

            /// Profile
          ],
        ),
      ),
    );
  }
}
