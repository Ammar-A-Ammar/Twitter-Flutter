import 'package:flutter/material.dart';
import '../../../components/rounded_button.dart';
import '../../forgot_password/FogotPassword.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';
import '../../../API/userdata.dart';

Future<String> ChangeUsernameAPI(
  String newUsername,
  String token,
) async {
  Map responsedata;
  Map bodydata = {
    "username": newUsername,
  };
  // Map headerdata = {
  //   "x-access-token": token,
  // };
  const String BaseURL = "http://twi-jay.me:8080";

  final response = await http.post(Uri.parse("$BaseURL/user/changeusername"),
      headers: {"x-access-token": token}, body: bodydata);
  print(bodydata);
  responsedata = (jsonDecode(response.body));
  String message = responsedata["message"];
  print(message);

  if (response.statusCode == 200) {
    userdata.username = newUsername;
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

class ChangeUsernamePage extends StatefulWidget {
  @override
  State<ChangeUsernamePage> createState() => _ChangeUsernamePageState();
}

class _ChangeUsernamePageState extends State<ChangeUsernamePage> {
  final newUsername = TextEditingController();

  //String token = widget.lxrdtoken;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    newUsername.dispose();

    super.dispose();
  }

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
                "Change username",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 40),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: TextFormField(
                            key: Key('new_username_field'),
                            obscureText: false,
                            initialValue: userdata.username,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "Current",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            key: Key('new_username_field'),
                            obscureText: false,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: "New",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(fontSize: 20),
                            controller: newUsername,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 60,
                          width: 200,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.3, 1],
                              colors: [
                                Color.fromARGB(255, 36, 134, 245),
                                Color.fromARGB(255, 14, 145, 221),
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(45),
                            ),
                          ),
                          child: SizedBox.expand(
                            child: TextButton(
                                key: Key('done_butt'),
                                child: Text(
                                  "Done",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () async {
                                  String message = await ChangeUsernameAPI(
                                      newUsername.text, userdata.token);
                                  setState(() {
                                    userdata.username = newUsername.text;
                                  });
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text(''),
                                      content: Text(message),
                                      actions: <Widget>[
                                        TextButton(
                                          key: Key('ok_butt_user'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            newUsername.clear();
                                          },
                                          child: const Text("Ok"),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
