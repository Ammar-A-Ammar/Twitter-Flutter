// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_app/screens/home/Timeline.dart';
import 'dart:convert';
//import 'package:shared_preferences/shared_preferences.dart';

import '../../components/google_rounded_button.dart';
import '../../components/google_sign_in.dart';
import '../../components/or_divider_line.dart';
import '../../components/rounded_button.dart';
import '../../components/widgets/CustomNavBar2.0.dart';
import '../../model/text_field_validation.dart';
import '../Settings/YourAccountSettings/deactivateaccpage.dart';
import '../forgot_password/FogotPassword.dart';
import '../../components/text_field_container.dart';
import '../home/twitter_home_page.dart';
import '../welcome/welcome_screen.dart';
import 'background_for_login_screen.dart';
import '../../API/userdata.dart';

class BodyForLoginScreen extends StatefulWidget {
  BodyForLoginScreen({
    Key key,
  }) : super(key: key);

  @override
  State<BodyForLoginScreen> createState() => _BodyForLoginScreenState();
}

class _BodyForLoginScreenState extends State<BodyForLoginScreen> {
  final formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackGroundForLoginScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'Sign in to Twitter',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              height: 5.5,
            ),
          ),
          GoogleRoundedButton(
            passedText: 'Sign in with Google',

            pressed: () {
              //final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              // final provider =
              //     Provider.of<GoogleSignInProvider>(context, listen: false);
              // provider.googleLogin();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return TwitterHomePage();
              //     },
              //   ),
              // );
            },
            //colorPassed: Colors.white,
            marginValue: 7,
            roundedPassedColor: Colors.grey,
            //highlightPassedColor: Colors.grey,
          ),
          // RoundedButton(
          //   passedText: 'Sign in with Apple',
          //   textColor: Colors.black,
          //   pressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return TwitterHomePage();
          //         },
          //       ),
          //     );
          //   },
          //   colorPassed: Colors.white,
          //   marginValue: 3,
          //   roundedpassedcolor: Colors.grey[700],
          //   highlightPassedColor: Colors.grey,
          // ),
          /* Container( //Or_divider_container_me
            padding: EdgeInsets.all(5),
            width: size.width * 0.8,
            child: Row(
              children: const [
                Text(
                  '------------------------- ',
                  style: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.w100,
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
                Text(
                  'or',
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.w100,
                    
                    //height: 1,
                  ),
                ),
                Text(
                  ' ----------------------------',
                  style: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.w100,
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
              ],
            ),
          ), */
          OrDivider(),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFieldContainer(
                  key: Key('Email_field'),

                  obs: false,
                  size: size,
                  titleText: '  Email',
                  passedOnChanged: (value) {},
                  validator: (value) => emailValidator.validate(value),
                  nameController: userController,
                  //doneButton: null,
                ),
                TextFieldContainer(
                    key: Key('Password_field'),
                    obs: true,
                    size: size,
                    titleText: '  Password',
                    passedOnChanged: (value) {},
                    nameController: passwordController,
                    doneButton: () {
                      SignIn(
                        userController.text,
                        passwordController.text,
                      );
                    }

                    //validator: (value) => emailValidator.validate(value),
                    ),
              ],
            ),
          ),
          RoundedButton(
            key: Key('Next_key'),
            passedText: 'Next',
            textColor: Colors.white,
            pressed: () async => {
              if (formKey.currentState.validate())
                {
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomNavBar(),
                    ),
                  ), */

                  await SignIn(
                    userController.text,
                    passwordController.text,
                  ),
                  if (userdata.activationmessage ==
                      "This account is deactivated!")
                    {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text(''),
                          content: Text(userdata.activationmessage +
                              "  Would you like to reactivate?"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'Log out'),
                              child: const Text("No"),
                            ),
                            TextButton(
                              onPressed: () async {
                                await ReactivateAccountApi();
                                // SignIn(userController.text,
                                //  passwordController.text);
                                userdata.activationmessage = null;
                                Navigator.pop(context, '');
                                await SignIn(userController.text,
                                    passwordController.text);
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        ),
                      )
                    }
                }
            },
            colorPassed: Colors.black,
            marginValue: 14,
            highlightPassedColor: Colors.white24,
            roundedpassedcolor: Colors.white24,
          ),
          RoundedButton(
            key: Key('Forgotpass_key'),
            passedText: 'Forgot password?',
            textColor: Colors.black,
            pressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ForgotPasswordScreen();
                  },
                ),
              );
            },
            colorPassed: Colors.white,
            marginValue: 3,
            roundedpassedcolor: Colors.grey,
            highlightPassedColor: Colors.grey,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),

          // ignore: avoid_unnecessary_containers
          SizedBox(
            width: size.width * 0.8,
            child: Row(
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 13, color: Colors.grey[700],
                    //height: 5.5,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomeScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    ' Sign up',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blueAccent,
                    ),
                  ),
                )
              ],
            ),
          ),

          /* Image.asset(
            'assests/icons/googlesvg.png',
            height: 50,
            width: 50,
          ), */
        ],
      ),
    );
  }

  SignIn(String email, String password) async {
    Map data = {"data": email, "password": password};
    //var jsonData = null;

    const String BaseURL = "http://twi-jay.me:8080";
    final response =
        await http.post(Uri.parse("$BaseURL/auth/signin"), body: data);
    Map dataResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString(userdata.token, token);
      userdata.token = dataResponse["accessToken"];
      userdata.name = dataResponse["user"]["name"];
      userdata.username = dataResponse["user"]["username"];
      userdata.idUser = dataResponse['user']['_id'];
      userdata.email = dataResponse["user"]["email"];
      userdata.phonenum = dataResponse["user"]["phoneNumber"];
      userdata.password = password;
      userdata.isdeactivated = dataResponse["user"]["isDeactivated"];
      userdata.isAdmin = dataResponse['user']['isAdmin'];
      userdata.profileImage = dataResponse['user']['profile_image_url'];
      print(userdata.activationmessage);
      print('ha?');
      print(userdata.token);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => CustomNavBar()),
          (Route<dynamic> route) => false);
    } else if (response.statusCode == 400) {
      userdata.activationmessage = dataResponse["message"];
      userdata.token = dataResponse["accessToken"];

      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
  }
/* class TextFieldContainer extends StatelessWidget {
  final String titleText;
  final ValueChanged<String> passedOnChanged;
  const TextFieldContainer({
    Key key,
    this.titleText,
    this.passedOnChanged,
    this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        //padding: EdgeInsets.all(0),
        //margin: EdgeInsets.all(0),
        width: size.width * 0.78,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            //width: size.width * 0.1,
          ),
        ),
        child: TextField(
          onChanged: passedOnChanged,
          decoration: InputDecoration(
              labelText: titleText //'  Phone, email, or username',
              ,
              icon: Icon(
                Icons.person,
                color: Colors.lightBlue,
              )
              //hintText: 'ssuuu',
              ),

          //maxLengthEnforced: false,
        ),
      ),
    );
  }
}
 */

}
