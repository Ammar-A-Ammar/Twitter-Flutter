import 'package:flutter/material.dart';
import 'package:twitter_app/API/userdata.dart';
import 'package:twitter_app/screens/Settings/bookmarkspage.dart';
//import 'package:twitter_app/screens/admin_page/admin_page.dart';

import '../../screens/Settings/settingspage.dart';
import '../../screens/admin_page/admin_page.dart';
import '../../screens/welcome/welcome_screen.dart';
import 'CustomNavBar2.0.dart';
import '../../API/userdata.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key key,
    String token,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 70,
                          child: CircleAvatar(
                            key: Key('Side_menu'),
                            backgroundImage: NetworkImage(userdata
                                        .profileImage !=
                                    null
                                ? userdata.profileImage
                                : 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'),
                            radius: 20,
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Text(
                          userdata.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          userdata.username,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Text(
                              userdata.followingsCount.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Following',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              '2 ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Followers',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CustomNavBar())),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.list_alt),
                  title: Text('Lists'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Topics'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.bookmark_border),
                  title: Text('Bookmarks'),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BookmarksPage())),
                ),
                ListTile(
                  leading: Icon(Icons.bolt),
                  title: Text('Moments'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.money_outlined),
                  title: Text('Monetization'),
                  onTap: () => null,
                ),
                Divider(
                  height: 2,
                ),
                ListTile(
                  leading: Icon(Icons.rocket_launch_outlined),
                  title: Text('Twitter for Professionals'),
                  onTap: () => {
                    if (userdata.isAdmin == true)
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminPage(
                              token: userdata.token,
                              adminToken: '',
                            ),
                          ),
                        )
                      }
                    else
                      {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            /* title: Text(
                              'Your comment',
                            ), */
                            content: Text(
                              "Sorry but you are not admin",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          /* actions: [
                              TextButton(
                                onPressed: () {
                                  // addPostt('gggggggg', 23);
                                },
                                child: Text('submit'),
                              ),
                            ], */
                        ),
                      }
                  },
                ),
                Divider(
                  height: 2,
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings and Pirvacy'),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage())),
                ),
                ListTile(
                  leading: Icon(Icons.help_outline_outlined),
                  title: Text('Help Center'),
                  onTap: () => null,
                ),
                Divider(
                  height: 2,
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () {
                    userdata.token = null;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
