/* import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../forgot_password/FogotPassword.dart';

class TwitterHomePage extends StatelessWidget {
  //const TwitterHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: const [
                Center(
                  child: Text('Something Went Wrong!'),
                ),
              ],
            );
          } else if (snapshot.hasData) {
            return ForgotPasswordScreen();
            /* Column(
              children: const [
                Center(
                  child: Text('Well done , u Got it!'),
                  
                ),

              ],
            ); */
          } else {
            return const Text(
              'Finaly Home !!',
              style: TextStyle(
                color: Colors.cyanAccent,
                fontSize: 20,
              ),
            );
          }
        });
  }
}
 */