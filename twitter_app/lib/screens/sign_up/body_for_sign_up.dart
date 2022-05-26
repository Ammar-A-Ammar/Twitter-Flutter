// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_app/API/userdata.dart';
import 'dart:convert';

import '../Login/background_for_login_screen.dart';
import '../../components/text_field_container.dart';
import '../../components/rounded_button.dart';
import '../../model/text_field_validation.dart';
import 'verification.dart';

class BodyForSignUpScreen extends StatefulWidget {
  BodyForSignUpScreen({
    Key key,
  }) : super(key: key);

  @override
  State<BodyForSignUpScreen> createState() => _BodyForSignUpScreenState();
}

class _BodyForSignUpScreenState extends State<BodyForSignUpScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = new TextEditingController();
  TextEditingController userController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();

  String token = '';
  String messagebody = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackGroundForLoginScreen(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create your account',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 5.5,
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFieldContainer(
                    key: Key('name_field_signup'),
                    obs: false,
                    validator: (value) => nameValidator.validate(value),
                    size: size,
                    titleText: '  Name',
                    passedOnChanged: (value) {},
                    nameController: nameController,
                  ),
                  TextFieldContainer(
                    key: Key('username_field_signup'),
                    obs: false,
                    //validator: (value) => emailValidator.validate(value),
                    size: size,
                    titleText: '  username',
                    passedOnChanged: (value) {},
                    nameController: userController,
                  ),
                  TextFieldContainer(
                    key: Key('Email_field_signup'),
                    obs: false,
                    validator: (value) => emailValidator.validate(value),
                    size: size,
                    titleText: '  Email',
                    passedOnChanged: (value) {},
                    nameController: emailController,
                  ),
                  TextFieldContainer(
                    key: Key('phone_field_singup'),
                    obs: false,
                    //validator: (value) => emailValidator.validate(value),
                    size: size,
                    titleText: '  Phone number',
                    passedOnChanged: (value) {},
                    nameController: phoneController,
                  ),
                  TextFieldContainer(
                    key: Key('pass_field_signup'),
                    obs: true,
                    //validator: (value) => emailValidator.validate(value),
                    size: size,
                    titleText: '  Password',
                    passedOnChanged: (value) {},
                    nameController: passwordController,
                  ),
                ],
              ),
            ),
            SizedBox(
              //height: size.height,
              width: size.width * 0.9,
              height: 30, //70
            ),
            Text(
              'Date of birth',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            Text(
              'This will not be shown publicly. Confirm your own age',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
                //fontWeight: FontWeight.bold,
                //height: 5.5,
              ),
            ),
            Text(
              'even if this account is for a business, a pet, or     ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            Text(
              'something else.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              //height: size.height,
              width: size.width * 0.9,
              height: 10,
            ),
            TextFieldContainer(
              key: Key('date'),
              obs: false,
              size: size,
              titleText: '  Date of birth',
              passedOnChanged: (value) {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022),
                  lastDate: DateTime.now(),
                );
              },
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            RoundedButton(
              key: Key('next_signup'),
              passedText: 'Next',
              textColor: Colors.white,
              pressed: () {
                if (formKey.currentState.validate()) {
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomNavBar(),
                    ),
                  ); */
                  //print('here ?');
                  SignUp(
                    nameController.text,
                    userController.text,
                    emailController.text,
                    phoneController.text,
                    passwordController.text,
                    dateController.text,
                    token,
                    messagebody,
                  );
                }
              }, //addTransaction //() {},
              colorPassed: Colors.grey[700],
              marginValue: 3,
              roundedpassedcolor: Colors.grey,
              highlightPassedColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  SignUp(String name, String userName, String email, String phone,
      String password, String date, String token, String messgbody) async {
    Map data = {
      "name": name,
      "username": userName,
      "email": email,
      "phoneNumber": phone,
      "dateOfBirth": date,
      "password": password,
    };
    //var jsonData = null;
    Map mapResponse;
    Map dataResponse;
    var response = await http
        .post(Uri.parse("http://twi-jay.me:8080/auth/signup"), body: data);

    /* print(name);
    print(userName);
    print(email);
    print(phone);
    print(password);
    print(date); */
    if (response.statusCode == 200) {
      mapResponse = json.decode(response.body);
      dataResponse = mapResponse;
      userdata.token = dataResponse["emailtoken"];
      userdata.username = userName;
      userdata.password = password;
      messgbody = dataResponse["message"];
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  VerificationBody(token: token)),
          (Route<dynamic> route) => false);
      setState(
        () {
          print('yayyyyyyyyy');
          print(token);

          //dataResponse = mapResponse;
        },
      );
      print(messgbody);
      print('goooooooooo');
      print(token);
      print(userdata.token);
    } else if (response.statusCode == 400) {
      print('bad request');
      print(messgbody);
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
  }
}
