import 'package:flutter/material.dart';
import '../../../components/rounded_button.dart';
import '../../forgot_password/FogotPassword.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';
import '../../../API/userdata.dart';

Future<String> ChangePasswordApi(
  String currentPassword,
  String password,
  String confirmNewPassword,
  String token,
) async {
  Map responsedata;
  Map bodydata = {
    "currentPassword": currentPassword,
    "password": password,
    "confirmNewPassword": confirmNewPassword
  };
  // Map headerdata = {
  //   "x-access-token": token,
  // };
  const String BaseURL = "http://twi-jay.me:8080";

  final response = await http.post(
      Uri.parse("$BaseURL/settings/changePassword"),
      headers: {"x-access-token": token},
      body: bodydata);
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

class ResetPasswordPage extends StatefulWidget {
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final CurrentPassword = TextEditingController();
  final NewPassword = TextEditingController();
  final ConfirmPassword = TextEditingController();

  //String token = widget.lxrdtoken;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    CurrentPassword.dispose();
    NewPassword.dispose();
    ConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          leading: IconButton(
            key: Key('back_changepass'),
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
                "Update password",
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
                          height: 10,
                        ),
                        Container(
                          child: TextFormField(
                            key: Key('currentpass_field'),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: "Current password",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(fontSize: 20),
                            controller: CurrentPassword,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextFormField(
                            key: Key('newpass_field'),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                labelText: "New password",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                                hintText: "At least 8 characters"),
                            style: TextStyle(fontSize: 20),
                            controller: NewPassword,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextFormField(
                            key: Key('confirmpass_field'),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                labelText: "Confirm new password",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                                hintText: "At least 8 characters"),
                            style: TextStyle(fontSize: 20),
                            controller: ConfirmPassword,
                          ),
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
                                key: Key('updatepass_field'),
                                child: Text(
                                  "Update password",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () async {
                                  String message = await ChangePasswordApi(
                                      CurrentPassword.text,
                                      NewPassword.text,
                                      ConfirmPassword.text,
                                      userdata.token);
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text(''),
                                      content: Text(message),
                                      actions: <Widget>[
                                        TextButton(
                                          key: Key('ok_button'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            CurrentPassword.clear();
                                            NewPassword.clear();
                                            ConfirmPassword.clear();
                                          },
                                          child: const Text("Ok"),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                        TextButton(
                            key: Key('forgotpass_butt'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen(),
                                ),
                              );
                            },
                            child: Text("Forgot your password?")),
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
