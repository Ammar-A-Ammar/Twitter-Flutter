import 'package:flutter/material.dart';
import 'package:twitter_app/components/widgets/CustomNavBar2.0.dart';

import 'package:twitter_app/screens/welcome/welcome_screen.dart';
import '../../API/userdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthContainer extends StatefulWidget {
  @override
  _AuthContainerState createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  bool initial = true;
  String token;
  @override
  Widget build(BuildContext context) {
    if (initial) {
      SharedPreferences.getInstance().then((sharedPrefValue) {
        setState(() {
          initial = false;
          token = sharedPrefValue.getString(userdata.token);
          print(token);
        });
      });
      return CircularProgressIndicator();
    } else {
      if (token == null) {
        return WelcomeScreen();
      } else {
        return CustomNavBar();
      }
    }
  }
}
