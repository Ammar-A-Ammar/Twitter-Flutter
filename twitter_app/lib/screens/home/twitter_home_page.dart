/* import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../forgot_password/FogotPassword.dart';
import '../../unused/body_for_home_page_screen.dart';
import '../../unused/logged_in_widget.dart';

class TwitterHomePage extends StatelessWidget {
  //const TwitterHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context)
      // ignore: prefer_const_constructors
      =>
      Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (snapshot.hasData) {
              return LoggedInWidget();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Something Went Wrong'),
              );
            }

            return BodyForHomePageScreen();
          },
        ),

        /* ValueListenableBuilder<Box<Transaction>>(
        valueListenable: Boxes.getTransactions().listenable(),
        builder: (context, box, _) {
          final transactions = box.values.toList().cast<Transaction>();

          return BodyForSignUpScreen();
        },
      ), */
      );
}
 */