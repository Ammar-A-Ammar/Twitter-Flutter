/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:twitter_app/screens/Login/body_for_login_screen.dart';
//import './components/body_for_login_screen.dart';
import '../../components/google_sign_in.dart';
import '../../components/widgets/CustomNavBar2.0.dart';
import '/model/text_field_validation.dart';

import '../../components/google_rounded_button.dart';
import '../../components/or_divider_line.dart';
import '../../components/rounded_button.dart';
import '../../components/text_field_container.dart';
import '../forgot_password/FogotPassword.dart';
import '../home/Timeline.dart';
import '../home/home_page_screen.dart';
import '../welcome/welcome_screen.dart';
import 'body_for_login_screen.dart';

//import 'background_for_login_screen.dart';

// ignore: use_key_in_widget_constructors
class LogInScreen2 extends StatelessWidget {
  LogInScreen2({Key key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: size.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 30,
                  //left: size.width * 0.4,
                  child: Image.asset(
                    'assests/images/FinalLogo.png',
                    width: size.width * 0.16,
                  ),
                ),
                Column(
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
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TwitterHomePage();
                            },
                          ),
                        );
                      },
                      //colorPassed: Colors.white,
                      marginValue: 7,
                      roundedPassedColor: Colors.grey,
                      //highlightPassedColor: Colors.grey,
                    ),
                    RoundedButton(
                      passedText: 'Sign in with Apple',
                      textColor: Colors.black,
                      pressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TwitterHomePage();
                            },
                          ),
                        );
                      },
                      colorPassed: Colors.white,
                      marginValue: 3,
                      roundedpassedcolor: Colors.grey[700],
                      highlightPassedColor: Colors.grey,
                    ),

                    OrDivider(),
                    Form(
                      key: formKey,
                      child: TextFieldContainer(
                        obs: false,
                        size: size,
                        titleText: '  Phone, email, or username',
                        passedOnChanged: (value) {},
                        validator: (value) => emailValidator.validate(value),
                      ),
                    ),
                    RoundedButton(
                      passedText: 'Next',
                      pressed: () => {
                        if (formKey.currentState.validate())
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustomNavBar(),
                              ),
                            ),
                          }
                      },
                      marginValue: 14,
                      highlightPassedColor: Colors.white24,
                      roundedpassedcolor: Colors.white24,
                    ),
                    RoundedButton(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 */