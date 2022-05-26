import 'package:flutter/material.dart';
import 'package:twitter_app/API/userdata.dart';
import '../../../components/rounded_button.dart';
import '../../forgot_password/FogotPassword.dart';
import '../../welcome/welcome_screen.dart';
import 'deactivateaccpage.dart';

class ConfrimPasswordPage extends StatelessWidget {
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
                          child: Text("Confirm your password",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w900)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "Complete your deactivation request by entering the password associated with your account",
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        Container(
                          child: TextFormField(
                            key: Key('verify_pass_field'),
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
                                  key: Key('deactivate_button'),
                                  child: Text(
                                    "Deactivate",
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
                                      String message =
                                          await DeactivateAccountApi();

                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text(''),
                                          content: Text(message),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                userdata.token = null;
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        WelcomeScreen(),
                                                  ),
                                                );
                                              },
                                              child: const Text("Ok"),
                                            ),
                                          ],
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
                                              key: Key('ok_butt_verify'),
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
