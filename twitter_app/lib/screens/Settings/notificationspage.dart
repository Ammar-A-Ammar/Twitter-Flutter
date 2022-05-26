import 'package:flutter/material.dart';
import 'package:twitter_app/screens/Settings/NotificationsPage/allnotifications.dart';
import 'package:twitter_app/screens/Settings/NotificationsPage/likes.dart';
import 'package:twitter_app/screens/Settings/searchsettingspage.dart';
import '../../components/widgets/sidemenu.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../API/userdata.dart';

import 'notificationsettings.dart';

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldkey,
          drawer: SideMenu(),
          appBar: AppBar(
            toolbarHeight: 50,
            elevation: 1,
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(
            //       Icons.settings,
            //     ),
            //     onPressed: () => Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => NotificationSettingsPage()),
            //     ),
            //   ),
            // ],
            centerTitle: false,
            title: Text(
              "Notifications",
            ),
            leading: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userdata.profileImage == null
                      ? 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'
                      : userdata.profileImage),
                  radius: 16,
                ),
              ),
              onTap: () {
                scaffoldkey.currentState?.openDrawer();
              },
            ),
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            bottom: TabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Likes'),
              ],
              labelColor: Colors.blueAccent,
            ),
          ),
          body: TabBarView(
            children: [
              AllNotificationsPage(),
              LikesNotificationsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
