// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_app/screens/forgot_password/verifycode.dart';
import '../../../API/userdata.dart';
import '../../components/rounded_button.dart';
import '../Login/background_for_login_screen.dart';
import '../../components/text_field_container.dart';

// ignore: use_key_in_widget_constructors
class BodyForForgotPassword extends StatefulWidget {
  @override
  State<BodyForForgotPassword> createState() => _BodyForForgotPasswordState();
}

class _BodyForForgotPasswordState extends State<BodyForForgotPassword> {
  //const BodyForForgotPassword({ Key? key }) : super(key: key);
  final username = TextEditingController();

  final datapassed = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackGroundForLoginScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find your Twitter account',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 5.5,
            ),
          ),
          TextFieldContainer(
            obs: false,
            size: size,
            titleText: '  Enter your username',
            passedOnChanged: (value) {},
            nameController: username,
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldContainer(
            obs: false,
            size: size,
            titleText: '  Enter your email or phone number',
            passedOnChanged: (value) {},
            nameController: datapassed,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          RoundedButton(
            passedText: 'Search',
            textColor: Colors.white,
            pressed: () async {
              ForgotPassword(username.text, datapassed.text);
            },
            colorPassed: Colors.grey[700],
            marginValue: 3,
            roundedpassedcolor: Colors.grey,
            highlightPassedColor: Color.fromARGB(255, 36, 22, 22),
          ),
        ],
      ),
    );
  }

  ForgotPassword(String username, String email) async {
    Map data = {"username": username, "data": email};
    //var jsonData = null;

    const String BaseURL = "http://twi-jay.me:8080";
    final response = await http
        .post(Uri.parse("$BaseURL/settings/forgetPassword"), body: data);
    Map dataResponse = json.decode(response.body);
    String message = dataResponse["message"];

    if (response.statusCode == 200) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString(userdata.token, token);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerificationPage(),
        ),
      );
    } else if (response.statusCode == 400) {
      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
    print(message);
    return message;
  }
}
