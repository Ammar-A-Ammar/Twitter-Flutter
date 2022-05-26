import 'package:flutter/material.dart';
import 'package:twitter_app/screens/Settings/YourAccountSettings/youraccountpage.dart';
import '../../../components/rounded_button.dart';
import '../../forgot_password/FogotPassword.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';
import '../../../API/userdata.dart';

Future<String> ChangeEmailApi(
  String newEmail,
  String token,
) async {
  Map responsedata;
  Map bodydata = {
    "email": newEmail,
  };
  // Map headerdata = {
  //   "x-access-token": token,
  // };
  const String BaseURL = "http://twi-jay.me:8080";

  final response = await http.post(Uri.parse("$BaseURL/user/changeemail"),
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

class ChangeEmailPage extends StatefulWidget {
  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  final newEmail = TextEditingController();
  void dispose() {
    // Clean up the controller when the widget is disposed.
    newEmail.dispose();

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
              Icons.close,
            ),
            onPressed: () => {Navigator.of(context).pop()},
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 1,
          centerTitle: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 40),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 120,
                        ),
                        Image.asset(
                          "assests/images/FinalLogo.png",
                          scale: 5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Change email",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w900)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "Your current email is" +
                                userdata.email +
                                " What would uou like to update it to? Your email is not displayed in your public profile on Mockingjay.",
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        Container(
                          child: TextFormField(
                            key: Key('change_Email_field'),
                            obscureText: false,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: "Email address",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(fontSize: 20),
                            controller: newEmail,
                          ),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        Container(
                          height: 40,
                          width: 350,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(45),
                            ),
                          ),
                          child: SizedBox.expand(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  key: Key('Next_button_changeemail'),
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () async {
                                    print(newEmail.text);
                                    print(userdata.email);
                                    if (userdata.email == newEmail.text) {
                                      String message = await ChangeEmailApi(
                                          newEmail.text, userdata.token);

                                      print("Matching" + message);
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text(''),
                                          content: Text(message),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, ''),
                                              child: const Text("Ok"),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      String message = await ChangeEmailApi(
                                          newEmail.text, userdata.token);
                                      setState(() {
                                        userdata.email = newEmail.text;
                                      });

                                      print("Successful" + message);
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text(''),
                                          content: Text(message),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                newEmail.clear();
                                              },
                                              child: const Text("Ok"),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  }),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
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
