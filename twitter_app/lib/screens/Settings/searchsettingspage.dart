import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class SearchSettingsPage extends StatefulWidget {
  @override
  State<SearchSettingsPage> createState() => _SearchSettingsPageState();
}

class _SearchSettingsPageState extends State<SearchSettingsPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.topCenter,
          child: Text(
            "Try searching for password reset, notifications, etc",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Search settings',
            ),
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
    );
  }
}
