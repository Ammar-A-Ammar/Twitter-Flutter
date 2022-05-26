// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:twitter_app/API/userdata.dart';
import 'package:twitter_app/components/widgets/DarkMode/changetheme.dart';

import '../../components/widgets/DarkMode/change_theme_button_widget.dart';

class DisplaySettingsPage extends StatefulWidget {
  DisplaySettingsPage({Key key}) : super(key: key);

  @override
  State<DisplaySettingsPage> createState() => _DisplaySettingsPageState();
}

class _DisplaySettingsPageState extends State<DisplaySettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 1,
          centerTitle: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Display settings",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                userdata.username,
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ),
        body: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      "Dark Mode",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Text(
                    "In Devolopment",
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
            ),

            // changetheme("Dark Theme"),
            //Switch(value: null, onChanged: null),
            //Container(height: 50, width: 50, child: ChangeThemeButtonWidget()),
          ],
        ),
      ),
    );
  }
}
