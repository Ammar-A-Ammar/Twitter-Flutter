// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

import 'package:twitter_app/screens/Login/login.dart';

import '../../components/google_rounded_button.dart';

import '../sign_up/sign_up.dart';
import 'background.dart';
import '../../components/rounded_button.dart';

//import 'package:sign_button/sign_button.dart';
//import 'package:twitter_app/API/google_signIn_api.dart';

/* class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount> login() => _googleSignIn.signIn();
} */

class BodyStartUpPage extends StatefulWidget {
  @override
  State<BodyStartUpPage> createState() => _BodyStartUpPageState();
}

class _BodyStartUpPageState extends State<BodyStartUpPage> {
  // Future googleLogin(
  //   String clientid,
  // ) async {
  //   Map data = {"googleId": clientid};
  //   //var jsonData = null;

  //   const String BaseURL = "http://twi-jay.me:8080";
  //   final response =
  //       await http.post(Uri.parse("$BaseURL/Oauth/google/signin"), body: data);
  //   Map dataResponse = json.decode(response.body);

  //   if (response.statusCode == 200) {
  //     // SharedPreferences prefs = await SharedPreferences.getInstance();
  //     // prefs.setString(userdata.token, token);
  //     userdata.token = dataResponse["accessToken"];
  //     userdata.name = dataResponse["user"]["name"];
  //     userdata.username = dataResponse["user"]["username"];
  //     userdata.idUser = dataResponse['user']['_id'];
  //     userdata.email = dataResponse["user"]["email"];
  //     userdata.phonenum = userdata.phonenum = "";
  //     // ? userdata.phonenum = " "
  //     // : dataResponse["user"]["phoneNumber"];

  //     userdata.isdeactivated = dataResponse["user"]["isDeactivated"];
  //     userdata.isAdmin = dataResponse['user']['isAdmin'];
  //     userdata.profileImage = dataResponse['user']['profile_image_url'];
  //     print(userdata.activationmessage);
  //     print('ha?');
  //     print(userdata.token);
  //     setState(
  //       () {
  //         //dataResponse = mapResponse["data"];
  //         //dataResponse["role"].toString() == 'Admin'
  //         Navigator.of(context).pushAndRemoveUntil(
  //             MaterialPageRoute(
  //                 builder: (BuildContext context) => CustomNavBar()),
  //             (Route<dynamic> route) => false);
  //       },
  //     );
  //   } else if (response.statusCode == 400) {
  //     userdata.activationmessage = dataResponse["message"];
  //     userdata.token = dataResponse["accessToken"];

  //     print('bad request');
  //   } else if (response.statusCode == 401) {
  //     print('Unauthorized');
  //   } else if (response.statusCode == 404) {
  //     print('Not Found');
  //   } else if (response.statusCode == 500) {
  //     print('Internal Server Error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int size = 500;
    //this size provide the total height and width of the screen

    return SafeArea(
      child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          //verticalDirection: VerticalDirection.down,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              'Happening now',
              style: TextStyle(
                  fontSize: 50, fontWeight: FontWeight.bold, height: 4),
            ),
            Text(
              'Join Twitter today.',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            GoogleRoundedButton(
              passedText: 'Sign up with Google',
              roundedPassedColor: Colors.grey,

              pressed: () {
                print("pressed");
                //googleLogin("any");
              },
              //colorPassed: Colors.grey,
              marginValue: 5,
            ),
            /* SignInButton.mini(
              buttonType: ButtonType.google,
              //onPressed: signIn, //() => {},
            ),
            RoundedButton(
              passedText: 'Sign up with Apple',
              textColor: Colors.black,
              pressed: () {},
              colorPassed: Colors.grey,
              marginValue: 3,
            ), */

            /* MaterialButton(
              minWidth: size.width * 0.86,
              height: 45,
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>  LoginPage(),
                //         ),
                //         );
              },
              //defining the Shape
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  borderRadius: BorderRadius.circular(40)),
    
              child: const Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ), */

            /* Container(
              padding: EdgeInsets.all(5),
              width: size.width * 0.86,
              child: Row(
                children: const [
                  Text(
                    '----------------------------- ',
                    style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.w100,

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

                      height: 1,
                    ),
                  ),
                ],
              ),
            ), */

            SizedBox(),
            /* Container(
              height: 70,
              width: 290,
              child: Card(
                color: Colors.amber,
                child: Text('3ez is ..........'),
              ),
            ), */
            RoundedButton(
              key: Key('signup_button'),
              passedText: 'Sign Up with Email',
              textColor: Colors.white,
              pressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                ),
              },
              colorPassed: Colors.lightBlue,
              roundedpassedcolor: Colors.lightBlue,
              marginValue: 3,
            ),
            /* Text(
              'By signing up , you agree to the Terms of Service and Privace Policy, including Cookie Use ',
              style: TextStyle(
                fontSize: 10,
                //fontWeight: FontWeight.bold,
                
                height: 7,
              ),
            ), */
            SizedBox(
              // height: size.height * 0.2,
              height: size * 0.2,
            ),
            Text(
              'Already have an account?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 3,
              ),
            ),
            RoundedButton(
              key: Key('sign_in_button'),
              passedText: 'Sign in',
              textColor: Colors.lightBlue,
              marginValue: 3,
              pressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                ),
              },
              colorPassed: Colors.white,
              roundedpassedcolor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
