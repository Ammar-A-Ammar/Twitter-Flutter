// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:twitter_app/screens/forgot_password/body_for_forgot_password.dart';

class ForgotPasswordScreen extends StatelessWidget {
  // ForgotPassPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Scaffold(
        body: BodyForForgotPassword(),
      ),
    );
  }
}
