// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => {Navigator.of(context).pop()},
          ),
        ),
        body: Center(
          child: Text(
            "Dummy Page",
            style: TextStyle(fontSize: 100),
          ),
        ),
      ),
    );
  }
}
