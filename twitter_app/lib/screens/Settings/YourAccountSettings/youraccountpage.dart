import 'package:flutter/material.dart';

import 'accountinfopage.dart';
import 'changepasspage.dart';
import 'deactivateaccpage.dart';
import '../../../API/userdata.dart';

class YourAccountPage extends StatefulWidget {
  @override
  State<YourAccountPage> createState() => _YourAccountPageState();
}

class _YourAccountPageState extends State<YourAccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          key: Key('arrow_back'),
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
              "Your Account",
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
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 400,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "See information about your account, change your password, or learn about your account deactivation.",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 30,
                    ),
                    title: Text('Account information'),
                    subtitle: Text('See information about your account'),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountInfoPage(),
                          )),
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.lock,
                      size: 30,
                    ),
                    title: Text('Change your password'),
                    subtitle: Text('Change your password at anytime'),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPasswordPage())),
                    },
                  ),
                  ListTile(
                    minVerticalPadding: 20,
                    leading: Icon(
                      Icons.heart_broken,
                      size: 30,
                    ),
                    title: Text('Deactivate Account'),
                    subtitle:
                        Text('Find out how you can deactivate your account'),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeactivateAccountPage())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
