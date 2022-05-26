import 'package:flutter/material.dart';
import 'package:twitter_app/API/userdata.dart';
import 'package:twitter_app/screens/Settings/YourAccountSettings/changeemailpage.dart';
import 'package:twitter_app/screens/Settings/YourAccountSettings/changephonenumpage.dart';
import '../../../components/rounded_button.dart';
import '../../forgot_password/FogotPassword.dart';
import '../../welcome/welcome_screen.dart';
import 'deactivateaccpage.dart';

class VerifyPasswordPagePhoneNum extends StatelessWidget {
  final confirmpassword = TextEditingController();
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
                          child: Text("Verify your password",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w900)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Re-enter your Twitter password to continue",
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        Container(
                          child: TextFormField(
                            key: Key('pass_ver'),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(fontSize: 20),
                            controller: confirmpassword,
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
                                  key: Key('next_ver'),
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
                                    print(confirmpassword.text);
                                    print(userdata.password);
                                    if (confirmpassword.text ==
                                        userdata.password) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ChangePhoneNumPage(),
                                        ),
                                      );
                                    } else
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text(''),
                                          content: Text(
                                              "Please enter a correct password"),
                                          actions: <Widget>[
                                            TextButton(
                                              key: Key('ver_ok'),
                                              onPressed: () =>
                                                  Navigator.pop(context, ''),
                                              child: const Text("Ok"),
                                            ),
                                          ],
                                        ),
                                      );
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
