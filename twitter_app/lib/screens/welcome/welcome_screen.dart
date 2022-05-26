// ignore_for_file: use_key_in_widget_constructors

//import 'dart:html';

import 'package:flutter/material.dart';

import 'body_startup_page.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BodyStartUpPage(),
      ),
    );
  }
}
