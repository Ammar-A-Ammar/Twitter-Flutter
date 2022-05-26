import 'package:flutter/material.dart';

//import 'package:twitter_app/screens/Login/body_for_login_screen.dart';
//import './components/body_for_login_screen.dart';

import 'body_for_sign_up.dart';

//import 'background_for_login_screen.dart';

// ignore: use_key_in_widget_constructors
class SignUpScreen extends StatelessWidget {
  //const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Scaffold(
        body: BodyForSignUpScreen(),

        /* ValueListenableBuilder<Box<Transaction>>(
          valueListenable: Boxes.getTransactions().listenable(),
          builder: (context, box, _) {
            final transactions = box.values.toList().cast<Transaction>();
    
            return BodyForSignUpScreen();
          },
        ), */
      ),
    );
  }
}
