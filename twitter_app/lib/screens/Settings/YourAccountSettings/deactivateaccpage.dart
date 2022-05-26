import 'package:flutter/material.dart';
import 'package:twitter_app/screens/Settings/YourAccountSettings/confirmpasspag.dart';
import 'package:twitter_app/screens/Settings/testpage.dart';
import '../../../API/userdata.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

Future<String> DeactivateAccountApi() async {
  Map responsedata;
  userdata.isdeactivated = false;

  // Map headerdata = {
  //   "x-access-token": token,
  // };
  const String BaseURL = "http://twi-jay.me:8080";

  final response = await http.put(
      Uri.parse("$BaseURL/settings/deactivateAccount"),
      headers: {"x-access-token": userdata.token},
      body: {});

  responsedata = (jsonDecode(response.body));
  String message = responsedata["message"];
  print(message);

  if (response.statusCode == 200) {
    userdata.isdeactivated = true;
  } else if (response.statusCode == 401) {
    print('Unauthorized');
  } else if (response.statusCode == 403) {
    print('Forbidden');
  } else if (response.statusCode == 500) {
    print('Internal Server Error');
  }

  return message;
}

Future<String> ReactivateAccountApi() async {
  Map responsedata;

  // Map headerdata = {
  //   "x-access-token": token,
  // };
  const String BaseURL = "http://twi-jay.me:8080";

  final response = await http.put(
      Uri.parse("$BaseURL/settings/reactivateAccount"),
      headers: {"x-access-token": userdata.token},
      body: {});

  responsedata = (jsonDecode(response.body));
  String message = responsedata["message"];
  print(message);

  if (response.statusCode == 200) {
    userdata.isdeactivated = false;
  } else if (response.statusCode == 401) {
    print('Unauthorized');
  } else if (response.statusCode == 403) {
    print('Forbidden');
  } else if (response.statusCode == 500) {
    print('Internal Server Error');
  }

  return message;
}

class DeactivateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => {Navigator.of(context).pop()},
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 1,
          centerTitle: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deactivate your account",
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 0, left: 5, right: 0),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(userdata.profileImage ==
                                null
                            ? 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'
                            : userdata.profileImage),
                        radius: 45,
                      ),
                      Text(
                        userdata.username,
                        style: TextStyle(fontSize: 35),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("This will deactivate your account",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  Text(
                      "You're about to start the process of deactivating your Mockingjay account. Your display name, @username, and public profile will no longer be viewale on Mockingjay for Web or Android.",
                      style: TextStyle(fontWeight: FontWeight.w300)),
                  Divider(
                    thickness: 2,
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("What else you should know",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  Text(
                      "You can restore your Twitter account if it was accidentally or wrongfully deactivated for up to 30 days after deactivation.",
                      style: TextStyle(fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Some account information may still be available in search engines,such as Google or Bing.",
                      style: TextStyle(fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      " If you just want to change your @username, you don't need to deactivate your account - edit it in your settings.",
                      style: TextStyle(fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "To use your current @username or email address with a different Twitter account, change them before you deactivate this account",
                      style: TextStyle(fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      " If you want to download your Twitter data, you'll need to complete both the request and download process before deactivating your account.",
                      style: TextStyle(fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      " Links to download your data cannot be sent to deactivated",
                      style: TextStyle(fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 1,
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(45),
                            ),
                          ),
                          child: SizedBox.expand(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: TextButton(
                                  key: Key('deactivate_button_2'),
                                  child: Text(
                                    "Deactivate",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.red,
                                      fontSize: 19,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ConfrimPasswordPage(),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
//RequestHandeling handeler;
  // if (await handeler
 //     .deactivateaccount("TOKEN")) {}