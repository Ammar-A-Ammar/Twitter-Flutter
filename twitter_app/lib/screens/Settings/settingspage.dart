import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:twitter_app/components/widgets/SearchBar/SearchBar.dart';

import '../home/Timeline.dart';
import 'displaysettingspage.dart';
import 'notificationsettings.dart';
import 'searchsettingspage.dart';
import 'testpage.dart';
import 'YourAccountSettings/youraccountpage.dart';
import '../../API/userdata.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          leading: IconButton(
            key: Key('back_settings'),
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 3,
          centerTitle: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                userdata.username,
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ),
        body: Column(
          //buildlist(),
          children: [
            // Material(
            //   elevation: 0,
            //   child: Container(
            //     alignment: Alignment.topCenter,
            //     child: SizedBox(
            //       width: 500,
            //       child: ElevatedButton.icon(
            //         icon: Icon(
            //           Icons.search,
            //           size: 24.0,
            //         ),
            //         label: Text('Search Settings', style: TextStyle()),
            //         onPressed: () => {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => SearchBar(),
            //             ),
            //           ),
            //         },
            //         style: ElevatedButton.styleFrom(
            //           shape: new RoundedRectangleBorder(
            //             borderRadius: new BorderRadius.circular(30.0),
            //           ),
            //           primary:
            //               Color.fromARGB(255, 211, 208, 208).withOpacity(0.9),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 25),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 30,
                    ),
                    title: Text('Your account'),
                    subtitle: Text('See information about your account'),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => YourAccountPage())),
                  ),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.notifications,
                  //     size: 30,
                  //   ),
                  //   title: Text('Notifications'),
                  //   subtitle: Text(
                  //       'Select the kinds of notifications you get about your activities,interests and recommendations'),
                  //   minVerticalPadding: 15,
                  //   onTap: () => Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => NotificationSettingsPage())),
                  // ),
                  ListTile(
                    leading: Icon(
                      Icons.brush,
                      size: 30,
                    ),
                    title: Text('Display'),
                    subtitle: Text('Manage media , display and sound'),
                    minVerticalPadding: 15,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplaySettingsPage())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
