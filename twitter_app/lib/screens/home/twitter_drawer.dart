import 'dart:ui';

import 'package:flutter/material.dart';

class TwitterDrawer extends StatelessWidget {
  const TwitterDrawer({
    Key key,
    this.onTap,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                // decoration: BoxDecoration(color: Colors.green),
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
                          backgroundImage: NetworkImage(
                              'https://previews.123rf.com/images/koblizeek/koblizeek2001/koblizeek200100050/138262629-usuario-miembro-de-perfil-de-icono-de-hombre-vector-de-s%C3%ADmbolo-perconal-sobre-fondo-blanco-aislado-.jpg'),
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Text(
                        'Mr.Ahmed hassan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        '@ammarhunter0',
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
                            '31 ',
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                onTap: () => onTap(context, 0),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () => onTap(context, 0),
              ),
              ListTile(
                leading: Icon(Icons.list_alt),
                title: Text('Lists'),
                onTap: () => onTap(context, 0),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Topics'),
                onTap: () => onTap(context, 0),
              ),
              ListTile(
                leading: Icon(Icons.bookmark_border),
                title: Text('Bookmarks'),
                onTap: () => onTap(context, 0),
              ),
              ListTile(
                leading: Icon(Icons.bolt),
                title: Text('Moments'),
                onTap: () => onTap(context, 0),
              ),
              ListTile(
                leading: Icon(Icons.money_outlined),
                title: Text('Monetization'),
                onTap: () => onTap(context, 0),
              ),
              Divider(
                height: 2,
              ),
              ListTile(
                leading: Icon(Icons.rocket_launch_outlined),
                title: Text('Twitter for Professionals'),
                onTap: () => onTap(context, 0),
              ),
              Divider(
                height: 2,
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings and Pirvacy'),
                onTap: () => onTap(context, 0),
              ),
              ListTile(
                leading: Icon(Icons.help_outline_outlined),
                title: Text('Help Center'),
                onTap: () => onTap(context, 0),
              ),
              Divider(
                height: 2,
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () => onTap(context, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
