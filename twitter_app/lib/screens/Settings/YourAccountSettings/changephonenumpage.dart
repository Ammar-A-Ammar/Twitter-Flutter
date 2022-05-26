import 'package:flutter/material.dart';
import 'package:twitter_app/screens/Settings/YourAccountSettings/accountinfopage.dart';
import 'package:twitter_app/screens/Settings/YourAccountSettings/youraccountpage.dart';
import '../../../components/rounded_button.dart';
import '../../forgot_password/FogotPassword.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';
import '../../../API/userdata.dart';

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

class ChangePhoneNumPage extends StatefulWidget {
  @override
  State<ChangePhoneNumPage> createState() => _ChangePhoneNumPageState();
}

class _ChangePhoneNumPageState extends State<ChangePhoneNumPage> {
  final phoneNum = TextEditingController();

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
                          child: Text("Change Phone ",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w900)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "Your current phone number is" +
                                userdata.phonenum +
                                " What would uou like to update it to? ",
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        Container(
                          child: TextFormField(
                            key: Key('phonenum_field'),
                            obscureText: false,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: "+20 Egypt",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(fontSize: 20),
                            controller: phoneNum,
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
                                  key: Key('next_phonenum'),
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
                                    print(phoneNum.text);
                                    print(userdata.phonenum);
                                    if (userdata.phonenum == phoneNum.text) {
                                      String message = await ChangePhoneNumApi(
                                          phoneNum.text, userdata.token);

                                      print("Matching" + message);
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text(''),
                                          content: Text(
                                              "You entered the same phone number registered"),
                                          actions: <Widget>[
                                            TextButton(
                                              key: Key('ok_but_pnum'),
                                              onPressed: () =>
                                                  Navigator.pop(context, ''),
                                              child: const Text("Ok"),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      String message = await ChangePhoneNumApi(
                                          phoneNum.text, userdata.token);
                                      setState(() {
                                        userdata.phonenum = phoneNum.text;
                                      });

                                      print("Successful " + message);
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
                                                phoneNum.clear();
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
