import 'package:flutter/material.dart';
import 'package:twitter_app/screens/Settings/YourAccountSettings/verifypasswordemailpage.dart';
import 'package:twitter_app/screens/Settings/YourAccountSettings/verifypasswordphonenumpage.dart';
import 'package:twitter_app/screens/welcome/welcome_screen.dart';
import '../../../API/userdata.dart';
import 'changeusernamepage.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

class AccountInfoPage extends StatefulWidget {
  @override
  State<AccountInfoPage> createState() => AccountInfoPageState();
}

class AccountInfoPageState extends State<AccountInfoPage> {
  void initState() {
    super.initState();
    setState(() {
      userdata.username;
      userdata.email;
      userdata.phonenum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          key: Key('Back_key_accinfo'),
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
              "Account information",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              userdata.username,
              style: TextStyle(fontSize: 15.0),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    key: Key('Username_tile'),
                    title: Text('Username'),
                    subtitle: Text(userdata.username),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeUsernamePage(),
                        ),
                      )
                    },
                  ),
                  ListTile(
                    key: Key('Email_tile'),
                    title: Text('Email'),
                    subtitle: Text(userdata.email),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyPasswordPageEmail(),
                        ),
                      )
                    },
                  ),
                  ListTile(
                    key: Key('Phonenum_tile'),
                    title: Text('Phone number'),
                    subtitle: userdata.phonenum == ""
                        ? Text("No phone number registered")
                        : Text(userdata.phonenum),
                    onTap: () => {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          child: Container(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: const Text(
                                    'Phone number',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                TextButton(
                                  key: Key('update_phonenum'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            VerifyPasswordPagePhoneNum(),
                                      ),
                                    );
                                  },
                                  child: const Text('Update'),
                                ),
                                TextButton(
                                    key: Key('delete_phonenum'),
                                    onPressed: () {
                                      print("clicked");
                                      setState(() {
                                        ChangePhoneNumApi("", userdata.token);
                                        userdata.phonenum = "";
                                        Navigator.pop(context, 'Delete');
                                      });
                                    },
                                    child: Text("Delete")),
                                TextButton(
                                    key: Key('cance_phonenum_menu'),
                                    onPressed: () {
                                      print("clicked");
                                      Navigator.pop(context, 'Cancel');
                                    },
                                    child: Text("Cancel")),
                              ],
                            ),
                          ),
                        ),
                      ),
                    },
                  ),
                  ListTile(
                    key: Key('logout_tile'),
                    minVerticalPadding: 20,
                    title: Text(
                      'Log out',
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Log out'),
                        content: const Text(
                            'Logging out will remove all Twitter data from this device'),
                        actions: <Widget>[
                          TextButton(
                            key: Key('cancel_logout'),
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                              key: Key('logout_button'),
                              onPressed: () {
                                userdata.token = null;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WelcomeScreen(),
                                  ),
                                );
                              },
                              child: Text("Log out")),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

Future<String> ChangePhoneNumApi(
  String phoneNum,
  String token,
) async {
  Map responsedata;
  Map bodydata = {
    "phone_number": phoneNum,
  };
  // Map headerdata = {
  //   "x-access-token": token,
  // };
  const String BaseURL = "http://twi-jay.me:8080";

  final response = await http.post(Uri.parse("$BaseURL/user/changePhoneNumber"),
      headers: {"x-access-token": token}, body: bodydata);
  print(bodydata);
  responsedata = (jsonDecode(response.body));
  String message = responsedata["message"];
  print(message);

  if (response.statusCode == 200) {
    return message;
  } else if (response.statusCode == 400) {
    print('bad request');
  } else if (response.statusCode == 401) {
    print('Unauthorized');
  } else if (response.statusCode == 404) {
    print('Not Found');
  } else if (response.statusCode == 500) {
    print('Internal Server Error');
  } else
    print("fail");
  //return ('${responsedata}');
  return message;
}
